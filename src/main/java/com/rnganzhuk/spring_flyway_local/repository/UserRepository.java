package com.rnganzhuk.spring_flyway_local.repository;

import com.rnganzhuk.spring_flyway_local.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

}
