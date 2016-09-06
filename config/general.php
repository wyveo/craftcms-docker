<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */

return array(

    'usePathInfo' => true,
    'omitScriptNameInUrls' => true,
    'allowAutoUpdates' => false,
    'addTrailingSlashesToUrls' => true,
    'maxUploadFileSize' => 16777216, // 16MB
    'defaultImageQuality' => 75,
    'imageDriver' => 'imagick',
    'generateTransformsBeforePageLoad' => true,
    'sendPoweredByHeader' => false,
    'cacheMethod' => 'redis'

);
