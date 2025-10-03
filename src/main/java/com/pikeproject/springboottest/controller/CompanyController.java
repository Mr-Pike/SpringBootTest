package com.pikeproject.springboottest.controller;

import com.pikeproject.springboottest.model.Company;
import com.pikeproject.springboottest.service.CompanyService;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigInteger;
import java.util.Optional;

@RestController
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @PostConstruct
    public void init() {
        System.out.println("CompanyController initialized");
    }

    @GetMapping("")
    public Iterable<Company> findAll() {
        return companyService.findAll();
    }

    @GetMapping("/{id}")
    public Optional<Company> findById(@PathVariable BigInteger id) {
        return companyService.findById(id);
    }

    @GetMapping("/search1/{name}")
    public Iterable<Company> findByNameContainingIgnoreCase(@PathVariable String name) {
        return companyService.findByName(name);
    }

    @GetMapping("/search2/{name}")
    public Iterable<Company> findByNameContaining(@PathVariable String name) {
        return companyService.findByNameContaining(name);
    }

    @GetMapping("/search3/{name}")
    public Iterable<Company> findByNameLikeNative(@PathVariable String name) {
        return companyService.findByNameLikeNative(name);
    }

    @PostMapping("")
    public Company save(@RequestBody Company company) {
        return companyService.save(company);
    }

    @PutMapping("/{id}")
    public Company update(@PathVariable BigInteger id, @RequestBody Company company) {
        return companyService.update(id, company);
    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable BigInteger id) {
        companyService.deleteById(id);
    }
}
