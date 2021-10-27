package com.cmds.web.controller;

import org.junit.Test;

import static org.junit.Assert.assertTrue;

public class MainControllerTest {

    @Test
    public void test() {
        MainController mainController = new MainController();
        System.out.println(mainController.calculateDirection(348.75));
        System.out.println(mainController.calculateDirection(348.74));
        System.out.println(mainController.calculateDirection(11.24));
        System.out.println(mainController.calculateDirection(11.25));
        assertTrue(mainController.calculateDirection(348.75).equals("N"));
        assertTrue(mainController.calculateDirection(348.74).equals("NNW"));
        assertTrue(mainController.calculateDirection(11.24).equals("N"));
        assertTrue(mainController.calculateDirection(11.25).equals("NNE"));

    }
}
