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
<% if item["Destination"][0] == "PHI" %>
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
<% if input["Implemented"] == "not" %>
/*              Bind this fucntion with the <%= input["Source"] %> status changed callback. */
<% end %>
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
<% if input["Type"] == "NBC" %>
<% if input["Implemented"] == "not" %>
/*              Bind this function with the <%= input["Source"] %> status changed callback. */
<% end %>
<% for item in input["Signal"] %>
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
<% end %>
