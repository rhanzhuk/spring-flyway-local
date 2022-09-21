#!/bin/sh
cat << EOF > /app/vault-agent.hcl
exit_after_auth = true
pid_file = "./pidfile"
auto_auth {
   method "kubernetes" {
       mount_path = "auth/kubernetes"
       config = {
           role = "universal"
       }
   }
   sink "file" {
       wrap_ttl = "2m"
       config = {
           path = "/app/vault-token-via-agent"
       }
   }
}
EOF

/helper/vault agent -config /app/vault-agent.hcl
VAULT_TOKEN=$(/helper/vault unwrap -field=token $(jq -r '.token' /app/vault-token-via-agent))
rm -f /app/vault-token-via-agent
exec /helper/envconsul --no-prefix=true -upcase -sanitize -once -vault-renew-token=false -vault-addr=${VAULT_ADDR} -vault-token=${VAULT_TOKEN} -secret secret/data/app-conf/spring-flyway-local/application.properties "$@"