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
public class HiringWorkflowDetails {

    @Column(name = "number_of_rounds")
    private Integer numberOfRounds;

    @Column(name = "rounds_description", length = 2000)
    private String roundsDescription;

    @Column(name = "expected_decision_days")
    private Integer expectedDecisionDays;

    @Column(name = "assignment_required")
    private Boolean assignmentRequired;

    @Column(name = "preparation_tips", length = 2000)
    private String preparationTips;
}
