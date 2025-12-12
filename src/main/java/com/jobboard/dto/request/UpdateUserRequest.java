package com.jobboard.dto.request;

import com.jobboard.entity.enums.UserRole;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UpdateUserRequest {

    private String firstName;

    private String lastName;

    @NotNull(message = "Role is required")
    private UserRole role;

    private Boolean enabled;
}
