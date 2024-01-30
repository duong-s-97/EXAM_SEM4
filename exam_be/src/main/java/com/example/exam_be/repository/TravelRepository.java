package com.example.exam_be.repository;

import com.example.exam_be.entities.TravelEntiti;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TravelRepository extends JpaRepository<TravelEntiti, Long>{
    List<TravelEntiti> getAllCity();
}
