package com.jobboard.repository;

import com.jobboard.entity.OtpCode;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface OtpCodeRepository extends JpaRepository<OtpCode, Long> {

    Optional<OtpCode> findTopByEmailAndUsedFalseOrderByCreatedAtDesc(String email);

    List<OtpCode> findByEmailAndUsedFalse(String email);

    void deleteByExpiresAtBefore(LocalDateTime dateTime);
}
