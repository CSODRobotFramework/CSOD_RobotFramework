*** Settings ***
Documentation     This resource file contains all the object locators for the Compensation Path keywords

*** Variables ***
${obj_ilt_learningpath_newcatalogLearningPath}    xpath=//*[@title='New Catalog Learning Path']
${obj_ilt_learningpaths_learningpath_newCatalogLearningPath_sectionHeader}    xpath=//*[@class='pageDescription' and contains(text(),'New Catalog Learning Path')]
${obj_ilt_learningpaths_learningpath_newCatalogLearningPath_catalog}    xpath=//label[text()='Catalog']/ancestor::tr[1]/descendant::*[@class='lookupInput']/descendant::input[1]
