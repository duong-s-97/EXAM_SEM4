package com.example.exam_be.service.impl;

import com.example.exam_be.entities.TravelEntiti;
import com.example.exam_be.repository.TravelRepository;
import com.example.exam_be.service.TravelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TravelServiceImpl implements TravelService {
    @Autowired
    private TravelRepository travelRepository;
    @Override
    public List<TravelEntiti> getAllCity(){
        return travelRepository.findAll();
    }
}
