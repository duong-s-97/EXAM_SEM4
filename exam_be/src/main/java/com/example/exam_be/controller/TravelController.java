package com.example.exam_be.controller;

import com.example.exam_be.entities.TravelEntiti;
import com.example.exam_be.service.TravelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/get-all")

public class TravelController {
    @Autowired
    private TravelService travelService;
    @GetMapping
    public String getAllCity(Model model){
        List<TravelEntiti> city = travelService.getAllCity();
        model.addAttribute("city",city);
        return "cityList";
    }
}
