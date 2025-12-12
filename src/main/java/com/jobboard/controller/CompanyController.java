package com.jobboard.controller;

import com.jobboard.entity.Company;
import com.jobboard.repository.CompanyRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/companies")
@RequiredArgsConstructor
public class CompanyController {

    private final CompanyRepository companyRepository;

    /**
     * Get all companies with pagination
     */
    @GetMapping
    public ResponseEntity<Page<Company>> getAllCompanies(Pageable pageable) {
        log.info("Fetching all companies");
        Page<Company> companies = companyRepository.findAll(pageable);
        return ResponseEntity.ok(companies);
    }

    /**
     * Get all companies without pagination (for dropdowns)
     */
    @GetMapping("/all")
    public ResponseEntity<List<Company>> getAllCompaniesList() {
        log.info("Fetching all companies list");
        List<Company> companies = companyRepository.findAll();
        return ResponseEntity.ok(companies);
    }

    /**
     * Get company by ID
     */
    @GetMapping("/{id}")
    public ResponseEntity<Company> getCompanyById(@PathVariable Long id) {
        log.info("Fetching company by id: {}", id);
        return companyRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    /**
     * Get company by slug
     */
    @GetMapping("/slug/{slug}")
    public ResponseEntity<Company> getCompanyBySlug(@PathVariable String slug) {
        log.info("Fetching company by slug: {}", slug);
        return companyRepository.findBySlug(slug)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    /**
     * Create new company
     */
    @PostMapping
    public ResponseEntity<Company> createCompany(@Valid @RequestBody Company company) {
        log.info("Creating new company: {}", company.getName());

        // Generate slug from name if not provided
        if (company.getSlug() == null || company.getSlug().isEmpty()) {
            company.setSlug(generateSlug(company.getName()));
        }

        Company savedCompany = companyRepository.save(company);
        log.info("Company created with id: {}", savedCompany.getId());
        return ResponseEntity.status(HttpStatus.CREATED).body(savedCompany);
    }

    /**
     * Update existing company
     */
    @PutMapping("/{id}")
    public ResponseEntity<Company> updateCompany(
            @PathVariable Long id,
            @Valid @RequestBody Company companyRequest) {
        log.info("Updating company with id: {}", id);

        return companyRepository.findById(id)
                .map(company -> {
                    company.setName(companyRequest.getName());
                    company.setSlug(companyRequest.getSlug() != null ? companyRequest.getSlug()
                            : generateSlug(companyRequest.getName()));
                    company.setWebsite(companyRequest.getWebsite());
                    company.setLogoUrl(companyRequest.getLogoUrl());
                    company.setAbout(companyRequest.getAbout());

                    Company updated = companyRepository.save(company);
                    log.info("Company updated: {}", id);
                    return ResponseEntity.ok(updated);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    /**
     * Delete company
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCompany(@PathVariable Long id) {
        log.info("Deleting company with id: {}", id);

        if (!companyRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }

        companyRepository.deleteById(id);
        log.info("Company deleted: {}", id);
        return ResponseEntity.noContent().build();
    }

    /**
     * Generate slug from company name
     */
    private String generateSlug(String name) {
        return name.toLowerCase()
                .replaceAll("[^a-z0-9\\s-]", "")
                .replaceAll("\\s+", "-")
                .replaceAll("-+", "-")
                .trim();
    }
}
