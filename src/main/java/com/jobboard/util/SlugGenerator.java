package com.jobboard.util;

import org.springframework.stereotype.Component;

import java.text.Normalizer;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * Utility class for generating URL-friendly slugs
 * Follows SEO best practices for slug generation
 */
@Component
public class SlugGenerator {

    private static final Pattern NON_LATIN = Pattern.compile("[^\\w-]");
    private static final Pattern WHITESPACE = Pattern.compile("[\\s]");
    private static final Pattern DASHES = Pattern.compile("[-]+");

    /**
     * Generate a URL-friendly slug from input text
     * 
     * Examples:
     * "Software Engineer - Java Developer" → "software-engineer-java-developer"
     * "Backend Developer (Node.js)" → "backend-developer-nodejs"
     * 
     * @param input The text to convert to slug
     * @return URL-friendly slug
     */
    public String generateSlug(String input) {
        if (input == null || input.trim().isEmpty()) {
            throw new IllegalArgumentException("Input cannot be null or empty");
        }

        // Normalize to decomposed form for handling accents
        String normalized = Normalizer.normalize(input, Normalizer.Form.NFD);

        // Convert to lowercase
        String lowercase = normalized.toLowerCase(Locale.ENGLISH);

        // Replace whitespace with dashes
        String noWhitespace = WHITESPACE.matcher(lowercase).replaceAll("-");

        // Remove non-latin characters (keeps alphanumeric, dashes, underscores)
        String slug = NON_LATIN.matcher(noWhitespace).replaceAll("");

        // Replace multiple consecutive dashes with single dash
        slug = DASHES.matcher(slug).replaceAll("-");

        // Remove leading/trailing dashes
        slug = slug.replaceAll("^-+|-+$", "");

        // If slug becomes empty after processing, use fallback
        if (slug.isEmpty()) {
            slug = "item-" + System.currentTimeMillis();
        }

        return slug;
    }

    /**
     * Generate unique slug by appending counter if slug already exists
     * 
     * @param baseSlug The base slug
     * @param counter  The counter to append
     * @return Unique slug with counter
     */
    public String generateUniqueSlug(String baseSlug, int counter) {
        return baseSlug + "-" + counter;
    }
}
