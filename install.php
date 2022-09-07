<?php
/**
 * The following functions are used by the extension engine to generate a new table
 * for the plugin / destroy it on removal.
 */


/**
 * This function is called on installation and is used to 
 * create database schema for the plugin
 */
function extension_install_eventlogs()
{
    $commonObject = new ExtensionCommon;

    $commonObject -> sqlQuery(
        "CREATE TABLE eventlogs (
        ID INTEGER NOT NULL AUTO_INCREMENT, 
        HARDWARE_ID INTEGER NOT NULL,
        LOG_NAME VARCHAR(255) DEFAULT NULL,
        ENTRY_TYPE VARCHAR(255) DEFAULT NULL,
        EVENT_ID INTEGER DEFAULT NULL,
        MACHINE_NAME VARCHAR(255) DEFAULT NULL,
        SOURCE VARCHAR(255) DEFAULT NULL,
        TIME_GENERATED DATETIME DEFAULT NULL,
        TIME_WRITTEN DATETIME DEFAULT NULL,
        MESSAGE TEXT DEFAULT NULL,
        PRIMARY KEY (ID,HARDWARE_ID)) ENGINE=INNODB;"
    );
}

/**
 * This function is called on removal and is used to 
 * destroy database schema for the plugin
 */
function extension_delete_eventlogs()
{
    $commonObject = new ExtensionCommon;
    $commonObject -> sqlQuery("DROP TABLE IF EXISTS `eventlogs`");
}

/**
 * This function is called on plugin upgrade
 */
function extension_upgrade_eventlogs()
{

}

?>

