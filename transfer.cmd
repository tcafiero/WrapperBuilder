set var1=D:\users\f91764a\workspace\Sandbox

copy /Y external_link.h %var1%\BCM_F142M\BCM_APP_L7_F142M\BCML7_CLIENT\Application\%1\Model
copy /Y external_link.c %var1%\BCM_F142M\BCM_APP_L7_F142M\BCML7_CLIENT\Application\%1\Model
copy /Y %1.h %var1%\BCM_F142M\BCM_APP_L7_F142M\BCML7_CLIENT\Application\%1\PublicInt
copy /Y %1.c %var1%\BCM_F142M\BCM_APP_L7_F142M\BCML7_CLIENT\Application\%1\Sources
copy /Y %1_SVCC_Input.csv %var1%\BCM_F142M\BCM_APP_L7_F142M\BCML7_CLIENT\Application\%1\Doc
copy /Y %1_SVCC_Output.csv %var1%\BCM_F142M\BCM_APP_L7_F142M\BCML7_CLIENT\Application\%1\Doc
copy /Y %1 VF030_config.h %var1%\BCM_F142M\BCM_APP_L7_F142M\BCML7_CLIENT\CONFIGURATION_FILES
