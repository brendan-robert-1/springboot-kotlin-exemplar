package com.example.demo.controller

import com.example.demo.service.ExampleService
import org.springframework.http.MediaType.APPLICATION_JSON_VALUE
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class ExampleController(
    private val exampleService: ExampleService
) {


    @GetMapping(
        path = ["/"],
        produces = [APPLICATION_JSON_VALUE]
    )
    fun helloWorld() =
        exampleService.getHello()
}