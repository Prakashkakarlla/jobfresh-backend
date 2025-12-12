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
public class CompensationDetails {

    @Column(name = "salary_min")
    private Integer salaryMin;

    @Column(name = "salary_max")
    private Integer salaryMax;

    @Column(name = "currency", length = 10)
    private String currency; // e.g., "INR", "USD"

    @Column(name = "salary_type", length = 50)
    private String salaryType; // e.g., "Fixed", "Variable", "CTC"

    @Column(name = "pay_frequency", length = 50)
    private String payFrequency; // e.g., "Monthly", "Annually"

    @Column(name = "benefits_summary", length = 1000)
    private String benefitsSummary;

    @Column(name = "additional_perks", length = 1000)
    private String additionalPerks;
}
