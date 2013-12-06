/******************************************************************************/
/**
 * \brief       <%= descriptor["Module"] %>.
 * \details     <%= details %>...  
 *
 * \file        <%= descriptor["Module"] %>.h
 * \project{
 *              Body Platform F142M L7
 *}
 * \author      <%= descriptor["Author"] %>
 * \since       <%= descriptor["Date"] %>
 * \history{     
 *              <%= descriptor["Date"] %>,
 *              <%= descriptor["Author"] %>,
 *              first release
 *}
 */
/******************************************************************************/


/*______ I N C L U D E - F I L E S ___________________________________________*/

#include "<%= descriptor["Module"] %>.h"
#include "<%= descriptor["Module"] %>_config.h"
#include "<%= descriptor["Module"] %>_Model.h"
#include "doup.h"
#include "gpep.h"
#include "syst.h"
#include "wkss.h"
<% for item in descriptor["Input"] %>
<% if item["Implemented"] != "not" %>
<%= #include "item["Source"][1]".h %>
<% end %>
#include "VF040.h"
//#include "VF032.h" /* TODO da decommentare quando verrà implementata la VF032 */
//#include "VF036.h" /* TODO da decommentare quando verrà implementata la VF036 */
//#include "VF048.h" /* TODO da decommentare quando verrà implementata la VF048 */
//#include "VF230.h" /* TODO da decommentare quando verrà implementata la VF230 */
#include "VF247.h"
#include "VF806.h"
#include "VF506.h"
#include "VF601.h"


/*______ L O C A L - D E F I N E S ___________________________________________*/

/*______ L O C A L - T Y P E S _______________________________________________*/

/*______ G L O B A L - D A T A _______________________________________________*/

/*______ P R I V A T E - D A T A _____________________________________________*/

/*______ L O C A L - D A T A _________________________________________________*/

/*outputs */
   bool_t VF027_DRL_Activation;
   bool_t VF027_LFPosLightOut;
   bool_t VF027_LHFParkTailLightFailSts;
   bool_t VF027_LHParkTailLightSts;
   bool_t VF027_LHRParkTailLightFailSts;
   bool_t VF027_LRPosLightOut;
   bool_t VF027_PowerFeedFrontL;
   bool_t VF027_PowerFeedFrontR;
   bool_t VF027_ReleSideMarker;
   bool_t VF027_RFPosLightOut;
   bool_t VF027_RHFParkTailLightFailSts;
   bool_t VF027_RHRParkTailLightFailSts;
   bool_t VF027_RRPosLightOut;

u_int08 VF027_ModelEventCounter;

/*______ L O C A L - M A C R O S _____________________________________________*/

/*______ I M P O R T - F U N C T I O N S - P R O T O T Y P E S _______________*/

/*______ L O C A L - F U N C T I O N S - P R O T O T Y P E S _________________*/

void VF027_ReadOutputs(void);

/*______ P R I V A T E - F U N C T I O N S ___________________________________*/

/*______ L O C A L - F U N C T I O N S _______________________________________*/

/*______ G L O B A L - F U N C T I O N S _____________________________________*/

/******************************************************************************/
/**
 * \brief       Initialize module.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
void VF027_Init(void)
{
	/* initialize inputs */
	VF027_ModelInputs.KeySts=VF040_KEY_OFF_STATUS;
	VF027_ModelInputs.DaytimeRunningLight=DRL_OFF_MENU_OFF;
	VF027_ModelInputs.DRL_Enable=VF027_DRL_OFF;
	VF027_ModelInputs.EngineSts=VF506_ENGINE_OFF;
	VF027_ModelInputs.LPosLightParkCmd=VF032_OFF;
	VF027_ModelInputs.PosLightCmd=VF027_OFF;
	VF027_ModelInputs.PosLightFollowMeCarCmd=VF027_OFF;
	VF027_ModelInputs.PosLightFollowMeCmd=VF027_OFF;
	VF027_ModelInputs.RPosLightParkCmd=VF032_OFF;
	VF027_ModelInputs.StopStartSts=VF027_OFF;
	VF027_ModelInputs.TrunkSts=VF027_OFF;

VF027_ReleSideMarker=VF027_RELE_OPEN;

VF027_PowerFeedFrontL=VF027_RELE_OPEN;
VF027_PowerFeedFrontR=VF027_RELE_OPEN;

VF027_LHFParkTailLightFailSts=VF027_OFF;
VF027_RHFParkTailLightFailSts=VF027_OFF;
VF027_LHRParkTailLightFailSts=VF027_OFF;
VF027_RHRParkTailLightFailSts=VF027_OFF;

VF027_DRL_Activation=VF027_DRL_DISABLE;


VF027_LRPosLightOut=VF027_POSLIGHTOUT_OFF;
VF027_RRPosLightOut=VF027_POSLIGHTOUT_OFF;
VF027_LFPosLightOut=VF027_POSLIGHTOUT_OFF;
VF027_RFPosLightOut=VF027_POSLIGHTOUT_OFF;

VF027_LHParkTailLightSts=VF027_OFF;
VF027_LHParkTailLightSts=VF027_OFF;


VF027_ModelOutputs.ReleSideMarker=VF027_ReleSideMarker;
DOUP_SetReleSideMarker(VF027_ModelOutputs.ReleSideMarker);

VF027_ModelOutputs.PowerFeedFrontL=VF027_PowerFeedFrontL;
DOUP_SetPowerFeedFrontL(VF027_ModelOutputs.PowerFeedFrontL);
VF027_ModelOutputs.PowerFeedFrontR=VF027_PowerFeedFrontR;
DOUP_SetPowerFeedFrontR(VF027_ModelOutputs.PowerFeedFrontR);

VF027_ModelOutputs.DRL_Activation=VF027_DRL_Activation;
DOUP_SetDRL_ActivationOut(VF027_DRL_Activation);

VF027_ModelOutputs.LFPosLightOut=VF027_LFPosLightOut;
DOUP_SetLFPosLightOut(VF027_LFPosLightOut);

VF027_ModelOutputs.LHFParkTailLightFailSts=VF027_LHFParkTailLightFailSts;
NETC_TX_EXTERNAL_LIGHTSLHFParkTailLightFailSts_bit = VF027_LHFParkTailLightFailSts;

VF027_ModelOutputs.LHParkTailLightSts=VF027_LHParkTailLightSts;
NETC_TX_EXTERNAL_LIGHTSLHParkTailLightSts_bit = VF027_LHParkTailLightSts;

VF027_ModelOutputs.LHRParkTailLightFailSts=VF027_LHRParkTailLightFailSts;
VF027_ModelOutputs.LRPosLightOut=VF027_LRPosLightOut;
VF027_ModelOutputs.RFPosLightOut=VF027_RFPosLightOut;
VF027_ModelOutputs.RHFParkTailLightFailSts=VF027_RHFParkTailLightFailSts;
VF027_ModelOutputs.RHRParkTailLightFailSts=VF027_RHRParkTailLightFailSts;
VF027_ModelOutputs.RRPosLightOut=VF027_RRPosLightOut;

  VF027_ModelEventCounter = 1;
}

/******************************************************************************/
/**
 * \brief       Wake up callback function.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
void VF027_WakeUp(void)
{
}

/******************************************************************************/
/**
 * \brief       Sleep callback function.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
void VF027_Sleep(void)
{
}

/******************************************************************************/
/**
 * \brief       Task to manage model events.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
void VF027_Task_ts(void)
{
  if (VF027_ModelEventCounter > 0)
  {
    VF027_Model();
    VF027_ReadOutputs();
    VF027_ModelEventCounter--;
  }
}

/******************************************************************************/
/**
 * \brief       Proxi status changed callback function.
 * \author      T. Cafiero
 * \since       20/11/2013
  * \TODO{
 *              Bind this fucntion with the PROXI status changed callback.
 *}
 */
/******************************************************************************/
void VF027_ProxiStatusChanged(void)
{
  u_int08 DRL;
/* TODO decommentare quando la funzione sarà definita */
//  DRL = VERS_GetDaytimeRunningLight();
  if(!(DRL == VF027_ModelInputs.DaytimeRunningLight))
  {
	VF027_ModelInputs.DaytimeRunningLight=DRL;
	VF027_ModelEventCounter++;
  }
}

/******************************************************************************/
/**
 * \brief       KeySts status changed callback function.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
void VF027_KeyStsStatusChanged(void)
{
  VF027_ModelInputs.KeySts = VF040_GetKeySts();
  
  VF027_ModelEventCounter++;
}


/******************************************************************************/
/**
 * \brief       VF027_NQS_VEHICLE_SETUP_Confirmation callback function.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
void VF027_NQS_VEHICLE_SETUP_Confirmation(void)
{
bool_t DRL_Enable;
	DRL_Enable=NETC_RX_NQS_VEHICLE_SETUPDRL_Enable_bit;
	if(!(DRL_Enable == VF027_ModelInputs.DRL_Enable))
	{
		VF027_ModelInputs.DRL_Enable = DRL_Enable; 
		VF027_ModelEventCounter++;
	}
}

/******************************************************************************/
/**
 * \brief       PosLightCmd status changed callback function.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
void VF027_PosLightCmdStatusChanged(void)
{
/* TODO decommentare quando la funzione sarà definita */
//  VF027_ModelInputs.PosLightCmd = VF247_GetPosLightCmd();  
  VF027_ModelEventCounter++;
}

/******************************************************************************/
/**
 * \brief       EngineSts status changed callback function.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
void VF027_EngineStsStatusChanged(void)
{
  VF027_ModelInputs.EngineSts = VF506_GetEngineSts();  
  VF027_ModelEventCounter++;
}

/******************************************************************************/
/**
 * \brief       LPosLightParkCmd status changed callback function.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
/* TODO aggiungere la seguente callback nella relativa VF quando implementata */
void VF027_LPosLightParkCmdStatusChanged(void)
{
/* TODO da decommentare quando la VF sara'implementata */
//  VF027_ModelInputs.LPosLightParkCmd = VF032_GetLPosLightParkCmd();  
  VF027_ModelEventCounter++;
}

/******************************************************************************/
/**
 * \brief       PosLightFollowMeCarCmd status changed callback function.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
/* TODO aggiungere la seguente callback nella relativa VF quando implementata */
void VF027_PosLightFollowMeCarCmdStatusChanged(void)
{
/* TODO da decommentare quando la VF sara'implementata */
//  VF027_ModelInputs.PosLightFollowMeCarCmd = VF036_GetPosLightFollowMeCarCmd();  
  VF027_ModelEventCounter++;
}

/******************************************************************************/
/**
 * \brief       PosLightFollowMeCmd status changed callback function.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
/* TODO aggiungere la seguente callback nella relativa VF quando implementata */
void VF027_PosLightFollowMeCmdStatusChanged(void)
{
/* TODO da decommentare quando la VF sara'implementata */
//  VF027_ModelInputs.PosLightFollowMeCmd = VF048_GetPosLightFollowMeCmd();  
  VF027_ModelEventCounter++;
}

/******************************************************************************/
/**
 * \brief       RPosLightParkCmd status changed callback function.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
/* TODO aggiungere la seguente callback nella relativa VF quando implementata */
void VF027_RPosLightParkCmdStatusChanged(void)
{
/* TODO da decommentare quando la VF sara'implementata */
//  VF027_ModelInputs.RPosLightParkCmd = VF032_GetRPosLightParkCmd();  
  VF027_ModelEventCounter++;
}

/******************************************************************************/
/**
 * \brief       StopStartSts status changed callback function.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
void VF027_StopStartStsStatusChanged(void)
{
  VF027_ModelInputs.StopStartSts = VF506_GetStopStartSts();  
  VF027_ModelEventCounter++;
}

/******************************************************************************/
/**
 * \brief       TrunkSts status changed callback function.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
void VF027_TrunkStsStatusChanged(void)
{
  VF027_ModelInputs.TrunkSts = VF806_GetTrunkSts();  
  VF027_ModelEventCounter++;
}




/******************************************************************************/
/**
 * \brief       Read output signals from the model and call status changed callback if needed.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
void VF027_ReadOutputs(void)
{

  if (VF027_DRL_Activation != VF027_ModelOutputs.DRL_Activation)
  {
    VF027_DRL_Activation = VF027_ModelOutputs.DRL_Activation;
    DOUP_SetDRL_ActivationOut(VF027_DRL_Activation);
  }
  if (VF027_LFPosLightOut != VF027_ModelOutputs.LFPosLightOut)
  {
    VF027_LFPosLightOut = VF027_ModelOutputs.LFPosLightOut;
    DOUP_SetLFPosLightOut(VF027_LFPosLightOut);
  }
  if (VF027_LHFParkTailLightFailSts != VF027_ModelOutputs.LHFParkTailLightFailSts)
  {
    VF027_LHFParkTailLightFailSts = VF027_ModelOutputs.LHFParkTailLightFailSts;
    NETC_TX_EXTERNAL_LIGHTSLHFParkTailLightFailSts_bit = VF027_LHFParkTailLightFailSts;
  }
  if (VF027_LHParkTailLightSts != VF027_ModelOutputs.LHParkTailLightSts)
  {
    VF027_LHParkTailLightSts = VF027_ModelOutputs.LHParkTailLightSts;
    NETC_TX_EXTERNAL_LIGHTSLHParkTailLightSts_bit = VF027_LHParkTailLightSts;
    GPEP_Net1EvtMsgTxReq( GPEP_EXTERNAL_LIGHTS_MASK );
  }
  if (VF027_LHParkTailLightSts != VF027_ModelOutputs.LHParkTailLightSts)
  {
    VF027_LHParkTailLightSts = VF027_ModelOutputs.LHParkTailLightSts;
    NETC_TX_EXTERNAL_LIGHTSLHParkTailLightSts_bit = VF027_LHParkTailLightSts;
    GPEP_Net1EvtMsgTxReq( GPEP_EXTERNAL_LIGHTS_MASK );
  }
  if (VF027_LHParkTailLightSts != VF027_ModelOutputs.LHParkTailLightSts)
  {
    VF027_LHParkTailLightSts = VF027_ModelOutputs.LHParkTailLightSts;
    NETC_TX_EXTERNAL_LIGHTSLHParkTailLightSts_bit = VF027_LHParkTailLightSts;
    GPEP_Net1EvtMsgTxReq( GPEP_EXTERNAL_LIGHTS_MASK );
  }
  
  if (VF027_LRPosLightOut != VF027_ModelOutputs.LRPosLightOut)
  {
    VF027_LRPosLightOut = VF027_ModelOutputs.LRPosLightOut;
    DOUP_SetLRPosLightOut(VF027_LRPosLightOut);
  }

  if (VF027_PowerFeedFrontL != VF027_ModelOutputs.PowerFeedFrontL)
  {
    VF027_PowerFeedFrontL = VF027_ModelOutputs.PowerFeedFrontL;
    DOUP_SetPowerFeedFrontL(VF027_PowerFeedFrontL);
  }
  if (VF027_PowerFeedFrontR != VF027_ModelOutputs.PowerFeedFrontR)
  {
    VF027_PowerFeedFrontR = VF027_ModelOutputs.PowerFeedFrontR;
    DOUP_SetPowerFeedFrontR(VF027_PowerFeedFrontR);
  }
  if (VF027_ReleSideMarker != VF027_ModelOutputs.ReleSideMarker)
  {
    VF027_ReleSideMarker = VF027_ModelOutputs.ReleSideMarker;
    DOUP_SetReleSideMarker(VF027_ReleSideMarker);
  }
  if (VF027_RFPosLightOut != VF027_ModelOutputs.RFPosLightOut)
  {
    VF027_RFPosLightOut = VF027_ModelOutputs.RFPosLightOut;
    DOUP_SetRFPosLightOut(VF027_RFPosLightOut);
  }
  if (VF027_RHFParkTailLightFailSts != VF027_ModelOutputs.RHFParkTailLightFailSts)
  {
    VF027_RHFParkTailLightFailSts = VF027_ModelOutputs.RHFParkTailLightFailSts;
    NETC_TX_EXTERNAL_LIGHTSRHFParkTailLightFailSts_bit = VF027_RHFParkTailLightFailSts;
  }
  if (VF027_RHRParkTailLightFailSts != VF027_ModelOutputs.RHRParkTailLightFailSts)
  {
    VF027_RHRParkTailLightFailSts = VF027_ModelOutputs.RHRParkTailLightFailSts;
    NETC_TX_EXTERNAL_LIGHTSRHRParkTailLightFailSts_bit = VF027_RHRParkTailLightFailSts;
  }
  if (VF027_RRPosLightOut != VF027_ModelOutputs.RRPosLightOut)
  {
    VF027_RRPosLightOut = VF027_ModelOutputs.RRPosLightOut;
    DOUP_SetRRPosLightOut(VF027_RRPosLightOut);
  }
}



///******************************************************************************/
///**
// * \brief       Start Timer with specified time. If Timer was already running it will be restarted
// * \author      T. Cafiero
// * \since       28/11/2013
// * \param       time to wait
// */
///******************************************************************************/
//void VF027_SetTimer(u_int32 time)
//{
//  CancelAlarm(VF027_Timer_al);
//  SetRelAlarm(VF027_Timer_al,MSEC(time),0);
//  VF027_ModelInputs.Timer = VERS_TIMER_RUNNING;
//  VF027_ModelEventCounter++;
//}
//
///******************************************************************************/
///**
// * \brief       Reset Timer function.
// * \author      T. Cafiero
// * \since       28/11/2013
// */
///******************************************************************************/
//void VF027_ResetTimer(void)
//{
//  CancelAlarm(VF027_Timer_al);
//  VF027_ModelInputs.Timer = VERS_TIMER_STOPPED;
//  VF027_ModelEventCounter++;
//}
//
///******************************************************************************/
///**
// * \brief       Timer expired callback function. Called when Timer expires.
// * \author      T. Cafiero
// * \since       28/11/2013
// */
///******************************************************************************/
//void VF027_TimerExpired(void)
//{
//  VF027_ModelInputs.Timer = VERS_TIMER_EXPIRED;
//  VF027_ModelEventCounter++;
//}


/******************************************************************************/
/**
 * \brief       Function to request the system to stay active.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
void VF027_StayActive(void)
{
  WKSS_TaskState(VF027_ApplicationTask, WKSS_ACTIVE_TASK);
}

/******************************************************************************/
/**
 * \brief       Function to allow the system to go to sleep.
 * \author      T. Cafiero
 * \since       28/11/2013
 */
/******************************************************************************/
void VF027_GoToSleep(void)
{
  WKSS_TaskState(VF027_ApplicationTask, WKSS_INACTIVE_TASK);
}

/*______ E N D _____ (VF027.c) _______________________________________________*/


