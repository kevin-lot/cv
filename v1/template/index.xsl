<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet	version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output		method="html"
  				encoding="utf-8"
  				indent="no" />

<xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html></xsl:text>
	<xsl:comment><![CDATA[[if lte IE 8]> <html class="ie678" lang="fr"> <![endif]]]> </xsl:comment>
	<xsl:comment><![CDATA[[if gt IE 8]> <!]]></xsl:comment>
		<xsl:text disable-output-escaping="yes">&lt;html lang="fr"> </xsl:text>
	<xsl:comment><![CDATA[<![endif]]]> </xsl:comment>
		<head>
			<meta charset="UTF-8" />
			<xsl:comment><![CDATA[[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]]]></xsl:comment>
			<title>Kevin Lot</title>
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<!-- CSS -->
			<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />

			<link rel="stylesheet" href="css/bootstrap-glyphicons.css" />
			<link rel="stylesheet" href="css/main.css" />
		</head>
		<body>
			<div class="container">
				<header id="header" class="clearfix">
					<div class="pull-left">
						<p class="clearfix job">
							<span class="pull-left type">
								Chef de projet<br />
								Consultant<br />
								Architecte
							</span>
							<span class="pull-left separator">}</span>
							<span class="pull-left web">web</span>
						</p>
					</div>
					<div class="pull-right">
						<h1 class="squareTitle squareTitleDown">Kevin LOT <small>31 ans</small></h1>
						<p>
							12 rue Baste 33300 Bordeaux<br />
							06.70.56.68.41 - mail@kevinlot.me<br />
							Niveau Licence Informatique<br />
							BTS Informatique de Gestion
						</p>
					</div>
				</header>

				<!-- APPLY TEMPLATES -->
				<xsl:apply-templates select="data/section1" />
				<xsl:apply-templates select="data/section2" />


			</div>
			<!-- JS -->
			<script src="//code.jquery.com/jquery-2.0.3.min.js"></script>
			<script src="js/main.js"></script>
			<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

			<script>

				$(document).ready(function() {
					setTimeout(function(){
						$('.collapse').collapse('toggle');
					},
					2000);
				});

				(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
					(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
					m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
				})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

				ga('create', 'UA-41865325-2', 'kevinlot.me');
				ga('send', 'pageview');
			</script>
		</body>

	<xsl:text disable-output-escaping="yes">&lt;/html></xsl:text>
</xsl:template>

<xsl:template match="section1">
	<section class="section">
		<h1 class="squareTitle squareTitleUp"><xsl:value-of select="name" /></h1>
		<div class="row panel-group" id="accordion{tag}">
			<xsl:apply-templates select="site" />
		</div>
	</section>
</xsl:template>


<xsl:template match="site">
	<div class="panel col-12 col-sm-12 {../col}">
		<div class="panel-heading">
			<h2 class="text-overflow">
				<a class="accordion-toggle noUnderline {color}" data-toggle="collapse" data-parent="#accordion{../tag}" href="#collapse{tag}"><span class="glyphicon glyphicon-plus"></span></a>
				<a class="accordion-toggle {color}" data-toggle="collapse" data-parent="#accordion{../tag}" href="#collapse{tag}"><xsl:value-of select="url" /></a>
				<small class="date"><xsl:value-of select="date" /></small>
			</h2>
		</div>
		<div id="collapse{tag}" class="panel-collapse collapse in">
	 		<div class="panel-body">
		        <xsl:value-of disable-output-escaping="yes" select="text" />
				<xsl:if test="boolean(number(modal))">
					<div class="clearfix">
						<p class="pull-left thumbnail">
							<a href="#modal{tag}" data-toggle="modal">
								<img data-placement="right" data-toggle="tooltip" data-original-title="Zoom" src="{srcImgSmall}" alt="" />
							</a>
						</p>
						<!-- Modal -->
						<div class="modal fade" id="modal{tag}">
							<div class="modal-dialog modalPerso">
						    	<div class="modal-content">
						        	<div class="modal-header">
										<button type="button" class="close {color}" data-dismiss="modal" aria-hidden="true"><xsl:text disable-output-escaping="yes">&amp;times;</xsl:text></button>
										<h4 class="modal-title {color}"><xsl:value-of select="name" /></h4>
									</div>
									<div class="modal-body">
										<p>
											<img src="{srcImg}" alt="" />
										</p>
									</div>
								</div><!-- /.modal-content -->
							</div><!-- /.modal-dialog -->
						</div><!-- /.modal -->
						<p class="pull-right"><a href="http://{url}" target="_blank">visiter le site</a></p>
					</div>
				</xsl:if>
			</div>
		</div>
	</div>
	<xsl:if test="boolean(number(../clearfix)) and (position() mod number(../clearfix) = 0)"><div class="clearfix"></div></xsl:if>
</xsl:template>

<xsl:template match="section2">
	<section class="section">
		<h1 class="squareTitle squareTitleUp"><xsl:value-of select="name" /></h1>
		<div class="row panel-group" id="accordion{tag}">
			<xsl:apply-templates select="comp" />
		</div>
	</section>
</xsl:template>

<xsl:template match="comp">
	<div class="panel col-12 col-sm-12 {../col}">
		<div class="panel-heading">
			<h2 class="text-overflow">
				<a class="accordion-toggle noUnderline {color}" data-toggle="collapse" data-parent="#accordion{../tag}" href="#collapse{tag}"><span class="glyphicon glyphicon-plus"></span></a>
				<a class="accordion-toggle {color}" data-toggle="collapse" data-parent="#accordion{../tag}" href="#collapse{tag}"><xsl:value-of select="name" /></a>
			</h2>
		</div>

		<div id="collapse{tag}" class="panel-collapse collapse in">
  			<div class="panel-body">
				<xsl:value-of disable-output-escaping="yes" select="text" />
			</div>
		</div>
	</div>
	<xsl:if test="boolean(number(../clearfix)) and (position() mod number(../clearfix) = 0)"><div class="clearfix"></div></xsl:if>
</xsl:template>



</xsl:stylesheet>