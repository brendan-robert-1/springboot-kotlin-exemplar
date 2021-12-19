package com.example.demo.service

import mu.KotlinLogging
import org.springframework.stereotype.Service

@Service
class ExampleService {

    private val logger = KotlinLogging.logger {}

    fun getHello(): String {
        logger.info("beginning hello world...")
        return "hello world!"
    }
}
