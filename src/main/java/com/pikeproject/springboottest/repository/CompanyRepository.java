package com.pikeproject.springboottest.repository;

import com.pikeproject.springboottest.model.Company;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.math.BigInteger;

@Repository
public interface CompanyRepository extends JpaRepository<Company, BigInteger> {
    // Exactly the name (= name).
    Iterable<Company> findByName(String name);

    // Contains part of name (LIKE %name%).
    Iterable<Company> findByNameContaining(String name);

    // Native Query (equivalent to findByNameContaining method)
    @Query(value = "SELECT * FROM company WHERE LOWER(name) LIKE LOWER(CONCAT('%', :name, '%'))", nativeQuery = true)
    Iterable<Company> findByNameLikeNative(@Param("name") String name);
}
