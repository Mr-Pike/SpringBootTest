package com.pikeproject.springboottest.service;

import com.pikeproject.springboottest.model.Company;
import com.pikeproject.springboottest.repository.CompanyRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.Optional;

@Service
public class CompanyService {

    @Autowired
    private CompanyRepository companyRepository;

    public Iterable<Company> findAll() {
        return companyRepository.findAll();
    }

    public Optional<Company> findById(BigInteger id) {
        return companyRepository.findById(id);
    }

    public Iterable<Company> findByName(String name) {
        return companyRepository.findByName(name);
    }

    public Iterable<Company> findByNameContaining(String name) {
        return companyRepository.findByNameContaining(name);
    }

    public Iterable<Company> findByNameLikeNative(String name) {
        return companyRepository.findByNameLikeNative(name);
    }

    public Company save(Company company) {
        return companyRepository.save(company);
    }

    public Company update(BigInteger id, Company company) {
        Company companyDb = findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Company with id " + id + " not found"));

        return companyRepository.save(company);
    }

    public void deleteById(BigInteger id) {
        companyRepository.deleteById(id);
    }
}
