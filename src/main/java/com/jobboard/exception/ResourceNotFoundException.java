package com.jobboard.exception;

/**
 * Custom exception for resource not found scenarios
 * Thrown when requested entity doesn't exist in database
 */
public class ResourceNotFoundException extends RuntimeException {

    public ResourceNotFoundException(String message) {
        super(message);
    }

    public ResourceNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
}
