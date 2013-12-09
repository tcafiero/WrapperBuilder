/******************************************************************************/
/**
 * \brief       <%= descriptor["Module"] %>.
 * \details     <%= details %>...  
 *
 * \file        <%= descriptor["Module"] %>.h
 * \project{
 *              <%= descriptor["Platform"] %>
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
<% for input in descriptor["Input"] %>
<% for item in input["Signal"] %>
<% if input["Implemented"] != "not" %>
#include "<%= input["Source"] %>.h"
<% else %>
/* TODO When <%= input["Source"] %> implemented delete comment on following statement */
//#include "<%= input["Source"] %>.h"
<% end %>
<% end %>
<% end %>


/*______ L O C A L - D E F I N E S ___________________________________________*/

/*______ L O C A L - T Y P E S _______________________________________________*/

/*______ G L O B A L - D A T A _______________________________________________*/

/*______ P R I V A T E - D A T A _____________________________________________*/

/*______ L O C A L - D A T A _________________________________________________*/

/*outputs */
<% for item in descriptor["Output"] %>
<%= item["Type"] %> <%= item["Name"] %>;
<% end %>
u_int08 <%= descriptor["Module"] %>_ModelEventCounter;

/*______ L O C A L - M A C R O S _____________________________________________*/

/*______ I M P O R T - F U N C T I O N S - P R O T O T Y P E S _______________*/

/*______ L O C A L - F U N C T I O N S - P R O T O T Y P E S _________________*/

void <%= descriptor["Module"] %>_ReadOutputs(void);

/*______ P R I V A T E - F U N C T I O N S ___________________________________*/

/*______ L O C A L - F U N C T I O N S _______________________________________*/

/*______ G L O B A L - F U N C T I O N S _____________________________________*/

/******************************************************************************/
/**
 * \brief       Initialize module.
 * \author      <%= descriptor["Author"] %>
 * \since       <%= descriptor["Date"] %>
 */
/******************************************************************************/
void <%= descriptor["Module"] %>_Init(void)
{
	/* initialize inputs */
<% for input in descriptor["Input"] %>
<% for item in input["Signal"] %>
<% if input["Implemented"] != "not" %>
<%= descriptor["Module"] %>_ModelInputs.<%= item["Name"] %>=<%= input["Source"] %>_<%= item["Value"][0][1] %>;
<% else %>
<%= descriptor["Module"] %>_ModelInputs.<%= item["Name"] %>=<%= descriptor["Module"] %>_<%= item["Value"][0][1] %>;
<% end %>
<% end %>
<% end %>

	/* initialize outputs */
<% for item in descriptor["Output"] %>
<%= descriptor["Module"] %>_<%= item["Name"] %>=<%= descriptor["Module"] %>_<%= item["Value"][0][1] %>;
<%= descriptor["Module"] %>_ModelOutputs.<%= item["Name"] %>=<%= descriptor["Module"] %>_<%= item["Name"] %>;
<% if item["Destination"][0] == "PHY" %>
<% for SignalName in item["ProcessorPin"] %>
DOUP_Set<%= SignalName %>(<%= descriptor["Module"] %>_<%= item["Name"] %>);
<% end %>
<% end %>
<% if item["Destination"][0] == "CAN" %>
<% for n in item["NetName"] %>
NETC_TX_<%= n %>=<%= descriptor["Module"] %>_<%= item["Name"] %>);
<% end %>
<% end %>
<% end %>
<%= descriptor["Module"] %>_ModelEventCounter = 1;
}

<% for input in descriptor["Input"] %>
<% if input["Type"] == "PROXI" %>
/* NOTE
   Bind following callback
   function: <%= descriptor["Module"] %>_<%= item["Name"] %>StatusChanged();
   in file: <%= descriptor["Module"] %>_config.h
   at section: G L O B A L - M A C R O S  */
/******************************************************************************/
/**
 * \brief       <%= input["Source"] %> status changed callback function.
 * \author      <%= descriptor["Author"] %>
 * \since       <%= descriptor["Date"] %>
 *}
 */
/******************************************************************************/
void <%= descriptor["Module"] %>_ProxiStatusChanged(void)
{
<% for item in input["Signal"] %>
<% if input["Implemented"] != "not" %>
<%= descriptor["Module"] %>_ModelInputs.<%= item["Name"] %>=VERS_Get<%= item["Name"] %>();
<% else %>
/* TODO  Delete following comment when <%= input["Source"] %> implemented*/
//<%= descriptor["Module"] %>_ModelInputs.<%= item["Name"] %>=VERS_Get<%= item["Name"] %>();
<% end %>
<% end %>
<%= descriptor["Module"] %>_ModelEventCounter++;
}



<% end %>
<%# NBC SIGNAL callback (START SECTION) %>
<% if input["Type"] == "NBC" %>
<% for item in input["Signal"] %>
/* NOTE
   Bind following callback
   function: <%= descriptor["Module"] %>_<%= item["Name"] %>StatusChanged();
   in file: <%= descriptor["Module"] %>_config.h
   at section: G L O B A L - M A C R O S  */
/******************************************************************************/
/**
 * \brief       <%= item["Name"] %> status changed callback function.
 * \author      <%= descriptor["Author"] %>
 * \since       <%= descriptor["Date"] %>
 *}
 */
/******************************************************************************/
void <%= descriptor["Module"] %>_<%= item["Name"] %>StatusChanged(void)
{
<% if input["Implemented"] != "not" %>
<%= descriptor["Module"] %>_ModelInputs.<%= item["Name"] %>=<%= input["Source"] %>_Get<%= item["Name"] %>();
<% else %>
/* TODO  Delete following comment when <%= input["Source"] %> implemented*/
//<%= descriptor["Module"] %>_ModelInputs.<%= item["Name"] %>=<%= input["Source"] %>_Get<%= item["Name"] %>();
<% end %>
<%= descriptor["Module"] %>_ModelEventCounter++;
}



<% end %>
<% end %>
<%# NBC SIGNAL callback (STOP SECTION) %>
<%# PHYSICAL SIGNAL callback (START SECTION) %>
<% if input["Type"] == "PHY" %>
<% for item in input["Signal"] %>
/* NOTE
   Bind following callback
   function: <%= descriptor["Module"] %>_<%= item["Name"] %>StatusChanged();
   in file: linp_config.h
   at section: Logical Input CALLBACK function mapping
   changing macro: #define Linp_EVENT_CALLBACK_<%= item["ProcessorPinName"] %>        LINP_DummyDirect
   into this:      #define Linp_EVENT_CALLBACK_<%= item["ProcessorPinName"] %>        <%= descriptor["Module"] %>_<%= item["Name"] %>StatusChanged
*/
/******************************************************************************/
/**
 * \brief       <%= item["Name"] %> status changed callback function.
 * \author      <%= descriptor["Author"] %>
 * \since       <%= descriptor["Date"] %>
 *}
 */
/******************************************************************************/
void <%= descriptor["Module"] %>_<%= item["Name"] %>StatusChanged(void)
{
<% if input["Implemented"] != "not" %>
<%= descriptor["Module"] %>_ModelInputs.<%= item["Name"] %>=(<%= item["Type"] %>) LINP_Get<%= item["Name"] %>();
<% else %>
/* TODO  Delete following comment when <%= input["Source"] %> has binding on this callback routine*/
//<%= descriptor["Module"] %>_ModelInputs.<%= item["Name"] %>=(<%= item["Type"] %>) LINP_Get<%= item["Name"] %>();
<% end %>
<%= descriptor["Module"] %>_ModelEventCounter++;
}



<% end %>
<% end %>
<%# PHYSICAL SIGNAL callback (STOP SECTION) %>
<%# NETWORK SIGNAL callback (START SECTION) %>
<% if input["Type"] == "CAN" %>
<% for item in input["Signal"] %>
/* NOTE
   Bind following callback
   function: <%= descriptor["Module"] %>_<%= item["MessageName"] %>_Confirmation();
   in file: linp_config.h
   at section: Logical Input CALLBACK function mapping
   changing macro: #define Linp_EVENT_CALLBACK_<%= item["ProcessorPinName"] %>        LINP_DummyDirect
   into this:      #define Linp_EVENT_CALLBACK_<%= item["ProcessorPinName"] %>        <%= descriptor["Module"] %>_<%= item["Name"] %>StatusChanged
*/
/******************************************************************************/
/**
 * \brief       <%= descriptor["Module"] %>_<%= item["MessageName"] %>_Confirmation callback function.
 * \author      <%= descriptor["Author"] %>
 * \since       <%= descriptor["Date"] %>
 *}
 */
/******************************************************************************/
void <%= descriptor["Module"] %>_<%= item["MessageName"] %>_Confirmation(void)
{
<% if input["Implemented"] != "not" %>
<%= descriptor["Module"] %>_ModelInputs.<%= item["Name"] %>=NETC_RX_<%= item["MessageName"] %><%= item["SignalName"] %>;
<% else %>
/* TODO  Delete following comment when <%= input["Source"] %> has binding on this callback routine*/
//<<%= descriptor["Module"] %>_ModelInputs.<%= item["Name"] %>=NETC_RX_<%= item["MessageName"] %><%= item["SignalName"] %>;
<% end %>
<%= descriptor["Module"] %>_ModelEventCounter++;
}



<% end %>
<% end %>
<%# PHYSICAL SIGNAL callback (STOP SECTION) %>
<% end %>


/******************************************************************************/
/**
 * \brief       Read output signals from the model and call status changed callback if needed.
 * \author      <%= descriptor["Author"] %>
 * \since       <%= descriptor["Date"] %>
*/
/******************************************************************************/
void <%= descriptor["Module"] %>_ReadOutputs(void)
{
<% for input in descriptor["Input"] %>
<% for item in descriptor["Output"] %>

