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
<% for signal in input["Signal"] %>
<% if signal["Implemented"] != "not" %>
#include "<%= signal["Source"] %>.h"
<% else %>
/* TODO When <%= signal["Source"] %> implemented delete comment on following statement */
//#include "<%= signal["Source"] %>.h"
<% end %>
<% end %>
<% end %>


/*______ L O C A L - D E F I N E S ___________________________________________*/

/*______ L O C A L - T Y P E S _______________________________________________*/

/*______ G L O B A L - D A T A _______________________________________________*/

/*______ P R I V A T E - D A T A _____________________________________________*/

/*______ L O C A L - D A T A _________________________________________________*/

/*outputs */
<% for output in descriptor["Output"] %>
<%= output["Type"] %> <%= output["Name"] %>;
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
<% for signal in input["Signal"] %>
<%= descriptor["Module"] %>_ModelInputs.<%= input["Name"] %>=<%= descriptor["Module"] %>_<%= input["Value"][0][0] %>;
<% end %>
<% end %>

	/* initialize outputs */
<% for output in descriptor["Output"] %>
<%= descriptor["Module"] %>_<%= Output["Name"] %>=<%= descriptor["Module"] %>_<%= Output["Value"][0][0] %>;
<%= descriptor["Module"] %>_ModelOutputs.<%= Output["Name"] %>=<%= descriptor["Module"] %>_<%= Output["Name"] %>;
<% for signal in output["Signal"]%>
<% if signal["Type"] == "PHY" %>
DOUP_Set<%= signal["ProcessorPinName"] %>(<%= descriptor["Module"] %>_<%= Output["Name"] %>);
<% end %>
<% if signal["Type"] == "CAN" %>
NETC_TX_<%= signal["SignalName"] %>=<%= descriptor["Module"] %>_<%= Output["Name"] %>);
<% end %>
<% end %>
<% end %>
<%= descriptor["Module"] %>_ModelEventCounter = 1;
}

<% proxi_used=0 %>
<% for input in descriptor["Input"] %>
<% for signal in input["Signal"] %>
<% if signal["Type"] == "PROXI" %>
<% proxi_used=1 %>
<% end %>
<% end %>
<% end %>
<% if proxi_used == 1 %>
/* NOTE
   Bind following callback
   function: <%= descriptor["Module"] %>_ProxiStatusChanged();
   in file: <%= descriptor["Module"] %>_config.h
   at section: G L O B A L - M A C R O S  */
/******************************************************************************/
/**
 * \brief       <%= descriptor["Module"] %>_ProxiStatusChanged callback function.
 * \author      <%= descriptor["Author"] %>
 * \since       <%= descriptor["Date"] %>
 *}
 */
/******************************************************************************/
void <%= descriptor["Module"] %>_ProxiStatusChanged(void)
{
<% for input in description["Input"] %>
<% for signal in input["Signal"] %>
<% if signal["Type"] == "PROXI" %>
<% if input["Implemented"] != "not" %>
<%= descriptor["Module"] %>_ModelInputs.<%= item["Name"] %>=VERS_Get<%= signal["Source"] %>();
<% else %>
/* TODO  Delete following comment when <%= input["Source"] %> implemented*/
//<% descriptor["Module"] %>_ModelInputs.<%= item["Name"] %>=VERS_Get<%= signal["Source"] %>();
<% end %>
<% end %>
<% end %>
<% end %>
<%= descriptor["Module"] %>_ModelEventCounter++;
}



<% end %>

<%# NBC SIGNAL callback (START SECTION) %>
<% for input in descriptor["Input"] %>
<% for signal in input["Signal"] %>
<% if signal["Type"] == "NBC" %>
/* NOTE
   Bind following callback
   function: <%= descriptor["Module"] %>_<%= input["Name"] %>StatusChanged();
   in file: <%= signal["Source"] %>_config.h
   at section: G L O B A L - M A C R O S  */
/******************************************************************************/
/**
 * \brief       <%= descriptor["Module"] %>_<%= input["Name"] %>StatusChanged callback function.
 * \author      <%= descriptor["Author"] %>
 * \since       <%= descriptor["Date"] %>
 *}
 */
/******************************************************************************/
void <%= descriptor["Module"] %>_<%= input["Name"] %>StatusChanged(void)
{
<% if signal["Implemented"] != "not" %>
<%= descriptor["Module"] %>_ModelInputs.<%= input["Name"] %>=<%= signal["Source"] %>_Get<%= input["Name"] %>();
<% else %>
/* TODO  Delete following comment when <%= signal["Source"] %> implemented*/
//<%= descriptor["Module"] %>_ModelInputs.<%= input["Name"] %>=<%= signal["Source"] %>_Get<%= input["Name"] %>();
<% end %>
<%= descriptor["Module"] %>_ModelEventCounter++;
}



<% end %>
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
<% for Output in descriptor["Output"] %>
<% for Signal in Output["Signal"] %>
<% end %>
<% end %>

