*** Settings ***
Resource          CSOD_Keywords.robot
Library           Selenium2Library    run_on_failure=AppiumLibrary.CapturePageScreenshot
Library           AppiumLibrary    run_on_failure=AppiumLibrary.CapturePageScreenshot
