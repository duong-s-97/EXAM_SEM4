package com.example.exam_be.service;

import com.example.exam_be.entities.TravelEntiti;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface  TravelService {
    List <TravelEntiti> getAllCity();
}
