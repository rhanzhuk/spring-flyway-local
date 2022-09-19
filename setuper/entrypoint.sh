#!/bin/bash
cat << EOF > /app/vault-agent.hcl
exit_after_auth = true
pid_file = "./pidfile"
auto_auth {
   method "kubernetes" {
       mount_path = "auth/kubernetes"
       config = {
           role = "read-secret-policy"
       }
   }
   sink "file" {
       wrap_ttl = "5m"
       config = {
           path = "/app/vault-token-via-agent"
       }
   }
}
EOF

/app/vault agent -config /app/vault-agent.hcl
VAULT_TOKEN=$(/app/vault unwrap -field=token $(jq -r '.token' /app/vault-token-via-agent))
rm -f /app/vault-token-via-agent
exec /app/envconsul --no-prefix=true -once -vault-renew-token=false -vault-addr=${VAULT_ADDR} -vault-token=${VAULT_TOKEN} -secret secret/data/spring/application.properties $@