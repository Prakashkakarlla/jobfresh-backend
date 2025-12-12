package com.jobboard.entity.embeddable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LegalAndPolicyDetails {

    @Column(name = "background_check_required")
    private Boolean backgroundCheckRequired;

    @Column(name = "bond_applicable")
    private Boolean bondApplicable;

    @Column(name = "bond_duration")
    private Integer bondDuration; // in months

    @Column(name = "notice_period_policy", length = 500)
    private String noticePeriodPolicy;

    @Column(name = "equal_opportunity_statement", length = 1000)
    private String equalOpportunityStatement;
}
