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
public class RoleContextDetails {

    @Column(name = "team_overview", length = 2000)
    private String teamOverview;

    @Column(name = "project_domain", length = 1000)
    private String projectDomain;

    @Column(name = "tech_stack", length = 1000)
    private String techStack;

    @Column(name = "career_path", length = 1000)
    private String careerPath;

    @Column(name = "ideal_candidate_profile", length = 2000)
    private String idealCandidateProfile;
}
