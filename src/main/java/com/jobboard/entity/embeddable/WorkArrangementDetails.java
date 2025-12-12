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
public class WorkArrangementDetails {

    @Column(name = "work_mode", length = 50)
    private String workMode; // e.g., "Remote", "Hybrid", "On-site"

    @Column(name = "office_location", length = 255)
    private String officeLocation;

    @Column(name

    = "working_hours", length = 100)
    private String workingHours; // e.g., "9 AM - 6 PM", "Flexible"

    @Column(name = "shift_type", length = 50)
    private String shiftType; // e.g., "Day Shift", "Night Shift", "Rotational"

    @Column(name = "weekend_work")
    private Boolean weekendWork;

    @Column(name = "travel_required")
    private Boolean travelRequired;

    @Column(name = "travel_percentage")
    private Integer travelPercentage; // 0-100%

    @Column(name = "work_environment", length = 1000)
    private String workEnvironment;
}
