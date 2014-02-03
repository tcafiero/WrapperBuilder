<?xml version="1.0" encoding="UTF-8"?>
<structure version="10" htmlmode="strict" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="Interface.xsd" workingxmlfile="VFtry.xml">
				<xmltablesupport/>
				<textstateicons/>
			</xsdschemasource>
		</schemasources>
	</schemasources>
	<modules/>
	<flags>
		<scripts/>
		<globalparts/>
		<designfragments/>
		<pagelayouts/>
	</flags>
	<scripts>
		<script language="javascript"/>
	</scripts>
	<importedxslt/>
	<globalstyles/>
	<mainparts>
		<children>
			<globaltemplate subtype="main" match="/">
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
					</documentsection>
					<newline/>
					<paragraph paragraphtag="h1">
						<children>
							<text fixtext="Wrapper Builder - Interface Editor"/>
						</children>
					</paragraph>
					<newline/>
					<image>
						<styles height="1.21in" width="0.79in"/>
						<target>
							<fixtext value="LogoAkhelaVerticale.bmp"/>
						</target>
						<imagesource>
							<fixtext value="LogoAkhelaVerticale.bmp"/>
						</imagesource>
					</image>
					<newline/>
					<newline/>
					<newline/>
					<template subtype="source" match="XML">
						<children>
							<template subtype="element" match="Interface">
								<children>
									<newline/>
									<text fixtext="Module"/>
									<newline/>
									<template subtype="attribute" match="Module">
										<children>
											<editfield>
												<styles margin-left="inherit" margin-right="inherit" width="5.78in"/>
												<children>
													<content>
														<format datatype="string"/>
													</content>
												</children>
											</editfield>
											<newline/>
										</children>
										<variables/>
									</template>
									<newline/>
									<text fixtext="Description"/>
									<newline/>
									<template subtype="attribute" match="Description">
										<children>
											<multilinefield>
												<styles height="0.33in" width="5.56in"/>
												<children>
													<content/>
												</children>
											</multilinefield>
											<newline/>
										</children>
										<variables/>
									</template>
									<newline/>
									<text fixtext="Details"/>
									<newline/>
									<template subtype="attribute" match="Details">
										<children>
											<multilinefield>
												<styles height="0.33in" width="5.82in"/>
												<children>
													<content/>
												</children>
											</multilinefield>
											<newline/>
										</children>
										<variables/>
									</template>
									<newline/>
									<text fixtext="Platform"/>
									<newline/>
									<template subtype="attribute" match="Platform">
										<children>
											<editfield>
												<styles width="6.46in"/>
												<children>
													<content/>
												</children>
											</editfield>
											<newline/>
										</children>
										<variables/>
									</template>
									<newline/>
									<text fixtext="Author"/>
									<newline/>
									<template subtype="attribute" match="Author">
										<children>
											<editfield>
												<styles width="5.80in"/>
												<children>
													<content/>
												</children>
											</editfield>
											<newline/>
										</children>
										<variables/>
									</template>
									<newline/>
									<text fixtext="Date"/>
									<newline/>
									<template subtype="attribute" match="Date">
										<children>
											<editfield>
												<styles width="5.69in"/>
												<children>
													<content>
														<format datatype="date"/>
													</content>
												</children>
											</editfield>
											<button>
												<action>
													<datepicker/>
												</action>
											</button>
											<newline/>
										</children>
										<variables/>
									</template>
									<newline/>
									<text fixtext="MIL"/>
									<newline/>
									<template subtype="attribute" match="MIL">
										<children>
											<radiobutton checkedvalue="true" checkedvalue1="1">
												<children>
													<content/>
												</children>
											</radiobutton>
										</children>
										<variables/>
									</template>
									<newline/>
									<newline/>
									<text fixtext="History"/>
									<newline/>
									<tgrid>
										<properties border="1"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol>
														<styles width="3.57in"/>
													</tgridcol>
													<tgridcol>
														<styles width="1.05in"/>
													</tgridcol>
													<tgridcol>
														<styles width="1.57in"/>
													</tgridcol>
												</children>
											</tgridbody-cols>
											<tgridheader-rows>
												<children>
													<tgridrow>
														<children>
															<tgridcell>
																<children>
																	<text fixtext="Description"/>
																</children>
															</tgridcell>
															<tgridcell>
																<children>
																	<text fixtext="Date"/>
																</children>
															</tgridcell>
															<tgridcell>
																<children>
																	<text fixtext="Author"/>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridheader-rows>
											<tgridbody-rows>
												<children>
													<template subtype="element" match="History">
														<children>
															<tgridrow>
																<styles height="0.95in"/>
																<children>
																	<tgridcell>
																		<children>
																			<template subtype="attribute" match="Description">
																				<children>
																					<multilinefield>
																						<styles height="0.72in"/>
																						<children>
																							<content/>
																						</children>
																					</multilinefield>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<children>
																			<template subtype="attribute" match="Date">
																				<children>
																					<editfield>
																						<styles width="1.13in"/>
																						<children>
																							<content>
																								<format datatype="date"/>
																							</content>
																						</children>
																					</editfield>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<children>
																			<template subtype="attribute" match="Author">
																				<children>
																					<editfield>
																						<styles width="1.33in"/>
																						<children>
																							<content/>
																						</children>
																					</editfield>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
														</children>
														<variables/>
													</template>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<newline/>
									<line/>
									<newline/>
									<paragraph paragraphtag="h3">
										<children>
											<text fixtext="INPUT SECTION"/>
										</children>
									</paragraph>
									<newline/>
									<template subtype="element" match="Input">
										<children>
											<newline/>
											<newline/>
											<text fixtext="Name"/>
											<newline/>
											<template subtype="attribute" match="Name">
												<children>
													<newline/>
													<editfield>
														<styles width="6.52in"/>
														<children>
															<content/>
														</children>
													</editfield>
													<newline/>
												</children>
												<variables/>
											</template>
											<newline/>
											<text fixtext="Type"/>
											<newline/>
											<template subtype="attribute" match="Type">
												<children>
													<newline/>
													<editfield>
														<styles width="6.48in"/>
														<children>
															<content/>
														</children>
													</editfield>
													<newline/>
												</children>
												<variables/>
											</template>
											<newline/>
											<text fixtext="Values"/>
											<newline/>
											<tgrid>
												<properties border="1"/>
												<children>
													<tgridbody-cols>
														<children>
															<tgridcol>
																<styles width="6.10in"/>
															</tgridcol>
														</children>
													</tgridbody-cols>
													<tgridbody-rows>
														<children>
															<template subtype="element" match="Value">
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<children>
																					<tgrid>
																						<properties border="1"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<template subtype="element" match="anon">
																										<children>
																											<tgridcol>
																												<styles width="1.07in"/>
																											</tgridcol>
																										</children>
																										<variables/>
																									</template>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<children>
																													<editfield>
																														<styles width="1.34in"/>
																														<children>
																															<content/>
																														</children>
																													</editfield>
																												</children>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
																<variables/>
															</template>
														</children>
													</tgridbody-rows>
												</children>
											</tgrid>
											<newline/>
											<newline/>
											<newline/>
											<paragraph paragraphtag="h4">
												<children>
													<text fixtext="Input from other VF"/>
												</children>
											</paragraph>
											<template subtype="element" match="NBC">
												<children>
													<newline/>
													<template subtype="attribute" match="VFname">
														<children>
															<newline/>
															<text fixtext="VFname"/>
															<newline/>
															<editfield>
																<styles width="6.48in"/>
																<children>
																	<content/>
																</children>
															</editfield>
															<newline/>
														</children>
														<variables/>
													</template>
													<newline/>
													<template subtype="attribute" match="Implemented">
														<children>
															<text fixtext="Implementd"/>
															<radiobutton checkedvalue="true" checkedvalue1="1">
																<children>
																	<content/>
																</children>
															</radiobutton>
														</children>
														<variables/>
													</template>
													<newline/>
												</children>
												<variables/>
											</template>
											<newline/>
											<paragraph paragraphtag="h4">
												<children>
													<text fixtext="Input from network"/>
												</children>
											</paragraph>
											<template subtype="element" match="Network">
												<children>
													<newline/>
													<template subtype="attribute" match="MessageName">
														<children>
															<newline/>
															<text fixtext="Message Name"/>
															<newline/>
															<editfield>
																<styles width="6.46in"/>
																<children>
																	<content/>
																</children>
															</editfield>
															<newline/>
														</children>
														<variables/>
													</template>
													<newline/>
													<template subtype="attribute" match="SignalName">
														<children>
															<newline/>
															<text fixtext="Signal Name"/>
															<newline/>
															<editfield>
																<styles width="6.43in"/>
																<children>
																	<content/>
																</children>
															</editfield>
															<newline/>
														</children>
														<variables/>
													</template>
													<newline/>
													<template subtype="attribute" match="Async">
														<children>
															<text fixtext="Async "/>
															<radiobutton checkedvalue="true" checkedvalue1="1">
																<children>
																	<content/>
																</children>
															</radiobutton>
														</children>
														<variables/>
													</template>
													<newline/>
												</children>
												<variables/>
											</template>
											<newline/>
											<paragraph paragraphtag="h4">
												<children>
													<text fixtext="Input from Pin"/>
												</children>
											</paragraph>
											<newline/>
											<template subtype="element" match="PIN">
												<children>
													<newline/>
													<template subtype="attribute" match="ProcessorPinName">
														<children>
															<newline/>
															<text fixtext="ProcessorPinName"/>
															<newline/>
															<editfield>
																<styles width="6.44in"/>
																<children>
																	<content/>
																</children>
															</editfield>
															<newline/>
														</children>
														<variables/>
													</template>
													<newline/>
												</children>
												<variables/>
											</template>
											<newline/>
											<paragraph paragraphtag="h4">
												<children>
													<text fixtext="Input from Proxy"/>
												</children>
											</paragraph>
											<newline/>
											<template subtype="element" match="Proxy">
												<children>
													<newline/>
													<template subtype="attribute" match="Implemented">
														<children>
															<text fixtext="Implemented "/>
															<radiobutton checkedvalue="true" checkedvalue1="1">
																<children>
																	<content/>
																</children>
															</radiobutton>
														</children>
														<variables/>
													</template>
													<newline/>
												</children>
												<variables/>
											</template>
											<newline/>
											<newline/>
											<line/>
											<newline/>
										</children>
										<variables/>
									</template>
									<newline/>
									<newline/>
									<line/>
									<newline/>
									<paragraph paragraphtag="h3">
										<children>
											<text fixtext="OUTPUT"/>
										</children>
									</paragraph>
									<template subtype="element" match="Output">
										<children>
											<newline/>
											<text fixtext="Name"/>
											<newline/>
											<template subtype="attribute" match="Name">
												<children>
													<newline/>
													<editfield>
														<styles width="6.52in"/>
														<children>
															<content/>
														</children>
													</editfield>
													<newline/>
												</children>
												<variables/>
											</template>
											<newline/>
											<text fixtext="Type"/>
											<newline/>
											<template subtype="attribute" match="Type">
												<children>
													<newline/>
													<editfield>
														<styles width="6.48in"/>
														<children>
															<content/>
														</children>
													</editfield>
													<newline/>
												</children>
												<variables/>
											</template>
											<newline/>
											<newline/>
											<text fixtext="Values"/>
											<newline/>
											<tgrid>
												<properties border="1"/>
												<children>
													<tgridbody-cols>
														<children>
															<tgridcol>
																<styles width="6.10in"/>
															</tgridcol>
														</children>
													</tgridbody-cols>
													<tgridbody-rows>
														<children>
															<template subtype="element" match="Value">
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<children>
																					<tgrid>
																						<properties border="1"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<template subtype="element" match="anon">
																										<children>
																											<tgridcol>
																												<styles width="1.07in"/>
																											</tgridcol>
																										</children>
																										<variables/>
																									</template>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<children>
																													<editfield>
																														<styles width="1.34in"/>
																														<children>
																															<content/>
																														</children>
																													</editfield>
																												</children>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
																<variables/>
															</template>
														</children>
													</tgridbody-rows>
												</children>
											</tgrid>
											<newline/>
											<paragraph paragraphtag="h4">
												<children>
													<text fixtext="Output for other VF"/>
												</children>
											</paragraph>
											<template subtype="element" match="NBC">
												<children>
													<newline/>
													<template subtype="attribute" match="VFname">
														<children>
															<newline/>
															<text fixtext="VFname"/>
															<newline/>
															<editfield>
																<styles width="6.48in"/>
																<children>
																	<content/>
																</children>
															</editfield>
															<newline/>
														</children>
														<variables/>
													</template>
													<newline/>
													<template subtype="attribute" match="Implemented">
														<children>
															<text fixtext="Implementd"/>
															<radiobutton checkedvalue="true" checkedvalue1="1">
																<children>
																	<content/>
																</children>
															</radiobutton>
														</children>
														<variables/>
													</template>
													<newline/>
												</children>
												<variables/>
											</template>
											<newline/>
											<paragraph paragraphtag="h4">
												<children>
													<text fixtext="Output for network"/>
												</children>
											</paragraph>
											<template subtype="element" match="Network">
												<children>
													<newline/>
													<template subtype="attribute" match="MessageName">
														<children>
															<newline/>
															<text fixtext="Message Name"/>
															<newline/>
															<editfield>
																<styles width="6.46in"/>
																<children>
																	<content/>
																</children>
															</editfield>
															<newline/>
														</children>
														<variables/>
													</template>
													<newline/>
													<template subtype="attribute" match="SignalName">
														<children>
															<newline/>
															<text fixtext="Signal Name"/>
															<newline/>
															<editfield>
																<styles width="6.43in"/>
																<children>
																	<content/>
																</children>
															</editfield>
															<newline/>
														</children>
														<variables/>
													</template>
													<newline/>
													<template subtype="attribute" match="Async">
														<children>
															<text fixtext="Async "/>
															<radiobutton checkedvalue="true" checkedvalue1="1">
																<children>
																	<content/>
																</children>
															</radiobutton>
														</children>
														<variables/>
													</template>
													<newline/>
												</children>
												<variables/>
											</template>
											<newline/>
											<paragraph paragraphtag="h4">
												<children>
													<text fixtext="Input from Pin"/>
												</children>
											</paragraph>
											<template subtype="element" match="PIN">
												<children>
													<newline/>
													<template subtype="attribute" match="ProcessorPinName">
														<children>
															<newline/>
															<text fixtext="ProcessorPinName"/>
															<newline/>
															<editfield>
																<styles width="6.44in"/>
																<children>
																	<content/>
																</children>
															</editfield>
															<newline/>
														</children>
														<variables/>
													</template>
													<newline/>
													<text fixtext="Diagnosis "/>
													<template subtype="attribute" match="Diagnosis">
														<children>
															<radiobutton checkedvalue="true" checkedvalue1="1">
																<children>
																	<content/>
																</children>
															</radiobutton>
														</children>
														<variables/>
													</template>
													<newline/>
												</children>
												<variables/>
											</template>
											<newline/>
											<newline/>
											<newline/>
											<line/>
											<newline/>
										</children>
										<variables/>
									</template>
									<newline/>
									<line/>
									<newline/>
									<paragraph paragraphtag="h3">
										<children>
											<text fixtext="TIMER"/>
										</children>
									</paragraph>
									<template subtype="element" match="Timer">
										<children>
											<newline/>
											<text fixtext="Name"/>
											<newline/>
											<template subtype="attribute" match="Name">
												<children>
													<newline/>
													<editfield>
														<styles width="6.52in"/>
														<children>
															<content/>
														</children>
													</editfield>
													<newline/>
												</children>
												<variables/>
											</template>
											<newline/>
											<template subtype="attribute" match="Implemented">
												<children>
													<text fixtext="Implementd"/>
													<radiobutton checkedvalue="true" checkedvalue1="1">
														<children>
															<content/>
														</children>
													</radiobutton>
												</children>
												<variables/>
											</template>
											<newline/>
											<line/>
											<newline/>
										</children>
										<variables/>
									</template>
									<newline/>
								</children>
								<variables/>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts/>
	<pagelayout>
		<properties paperheight="11.69in" paperwidth="8.27in"/>
	</pagelayout>
	<designfragments/>
</structure>
