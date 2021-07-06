<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <!-- exclusion du préfixe tei des résultats lors de la sortie HTML  -->
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <!-- Paramétrage de la sortie au format html. -->
    <xsl:strip-space elements="*"/>
    <!-- Suppression des espaces non voulus -->
    <xsl:template match="/">
    
    <!-- CONFIGURATION DES RÈGLES DE SORTIE -->
    <xsl:variable name="witfile">
    <xsl:value-of select="replace(base-uri(Lettres_TEI_Legrand_2021), '.xml', '')"/>
    <!-- récupération du nom et du chemin du fichier courant -->
    </xsl:variable>
    <xsl:variable name="pathHome">
        <xsl:value-of select="concat($witfile,'home','.html')"/>
        <!-- variable pour le contenu de home.html  -->
    </xsl:variable>
    <xsl:variable name="pathlettre1">
        <xsl:value-of select="concat($witfile,'lettre1','.html')"/>
        <!-- variable pour le contenu de la lettre1.html  -->
    </xsl:variable>
    <xsl:variable name="pathlettre2">
        <xsl:value-of select="concat($witfile,'lettre2','.html')"/>
        <!-- variable pour le contenu de lettre2.html  -->
    </xsl:variable>
    <xsl:variable name="pathlettre3">
         <xsl:value-of select="concat($witfile,'lettre3','.html')"/>
     <!-- variable pour le contenu de lettre2.html  -->
        </xsl:variable>
    <xsl:variable name="pathIndexPers">
        <xsl:value-of select="concat($witfile,'indexpers','.html')"/>
        <!-- variable pour le contenu de index de personnes.html  -->
    </xsl:variable>
    <xsl:variable name="pathIndexLieux">
        <xsl:value-of select="concat($witfile,'indexlieux','.html')"/>
        <!-- variable pour le contenu de index de lieux.html  -->
    </xsl:variable>
    <xsl:variable name="pathIndexOrg">
        <xsl:value-of select="concat($witfile,'indexorg','.html')"/>
        <!-- variable pour le contenu de index des organismes.html  -->
    </xsl:variable>
    <!-- VARIABLES CONTENANT LES PARTIES COMMUNES À TOUTES LES PAGES -->
    <xsl:variable name="doc_head">
        <!-- variable contenant le <head> -->
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <link rel="stylesheet" type="text/css" href="Lettres_TEI_Legrand_2021.css"/>
            <title>Correspondance Panassié - Delaunay</title>
        </head>
    </xsl:variable>
    <xsl:variable name="navheader">
        <!-- variable contenant la navbar et le <header> -->
        <nav class="nav-global fixed-top">
            <form class="nav-form" action="{$pathHome}" method="get">
                <button class="dropbtn" style="margin-right: 3%;">Accueil</button>
            </form>
            <div class="nav-list">
                <form class="dropdown nav-form">
                    <button class="dropbtn">Les lettres</button>
                    <div class="dropdown-content">
                        <a href="{$pathlettre1}">Lettre 1</a>
                        <a href="{$pathlettre2}">Lettre 2</a>
                        <a href="{$pathlettre3}">Lettre 3</a>
                    </div>
                </form>
                <form class="dropdown nav-form">
                    <button class="dropbtn">Les index</button>
                    <div class="dropdown-content">
                        <a href="{$pathIndexPers}">Index des personnes</a>
                        <a href="{$pathIndexLieux}">Index des Lieux</a>
                        <a href="{$pathIndexOrg}">Index des organismes</a>
                    </div>
                </form>
            </div>
        </nav>
        <header class="header-global">
            <div>
                <h1><xsl:value-of select="//titleStmt//title"/></h1>
                <h2 style="font-family: Garamont;">conservées au domicile de  <xsl:value-of select="//publicationStmt//authority"/></h2>
                <h3>(Encodage réalisé avec son autorisation)</h3>
            </div>
        </header>
      </xsl:variable>
        <xsl:variable name="footer">
            <!-- variable contenant le <footer> -->
            <div>
                <footer class="bloc-footer">
                    <div>
                        <div class="global-footer">
                            <div class="text-footer">
                                <div class="name-footer-global">
                                    <div class="name-footer">
                                        © Anne Legrand
                                    </div>
                                </div>
                                <p class="credit-footer">Projet développé en 2021 dans le cadre des enseignements du <a href="http://www.chartes.psl.eu/fr/cursus/master-technologies-numeriques-appliquees-histoire" target="_blank">Master &#171; Technologies numériques appliquées à l'histoire &#187;</a> de l'École nationale des chartes.</p>
                            </div>
                            <div class="box-img-footer">
                                <a href="http://www.chartes.psl.eu/" target="_blank">
                                    <img src="chartes.png" alt="Logo de l'École des chartes" class="img-footer"/>
                                </a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </xsl:variable>
        <!-- ÉCRITURE DES PAGES DU SITE -->
        <!-- PAGE D'ACCUEIL -->
        <xsl:result-document href="{$pathHome}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$doc_head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="arriere_plan">
                        <div class="global_home">
                            <figure class="div_img">
                                <img src="IMG_1685.jpg" class="img"/>
                            </figure>
                            <div class="p_home">
                                <h1 style="text-indent: 5%;">Bienvenue !</h1>
                                <p><xsl:value-of select="//encodingDesc/projectDesc/p"/></p>
                                <p><xsl:text>Ce projet est développé par </xsl:text><xsl:value-of select="//respStmt//forename"/><xsl:text> </xsl:text><xsl:value-of select="//respStmt//surname"/>.</p>
                            </div>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
        <!-- PAGE DE LA LETTRE 1 -->
        <xsl:result-document href="{$pathlettre1}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$doc_head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="arriere_plan">
                        <div class="page-global">
                            <h1><xsl:apply-templates select="//div[@type='letter'][@n='1']//head"/></h1>
                            <h2><xsl:apply-templates select="//div[@type='letter'][@n='1']//dateline"/></h2>
                            <h3><xsl:apply-templates select="//div[@type='letter'][@n='1']//opener/salute"/></h3>
                             <div>
                                 <xsl:apply-templates select="//div[@type='letter'][@n='1']//closer/preceding-sibling::p"/>
                             </div>
                            <div><xsl:apply-templates select="//div[@type='letter'][@n='1']//closer/salute"/></div>
                            <h3><xsl:apply-templates select="//div[@type='letter'][@n='1']//closer/signed"/></h3>
                            <div><xsl:apply-templates select="//div[@type='letter'][@n='1']//postscript"/></div>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
        <!-- PAGE DE LA LETTRE 2 -->
        <xsl:result-document href="{$pathlettre2}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$doc_head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="arriere_plan">
                        <div class="page-global">
                            <h1>Lettre n°2</h1>
                            <h1><xsl:apply-templates select="//div[@type='letter'][@n='2']//head"/></h1>
                            <h2><xsl:apply-templates select="//div[@type='letter'][@n='2']//dateline"/></h2>
                            <h3><xsl:apply-templates select="//div[@type='letter'][@n='2']//opener/salute"/></h3>
                            <div>
                                <xsl:apply-templates select="//div[@type='letter'][@n='2']/closer/preceding-sibling::p"/>
                            </div>
                            <div><xsl:apply-templates select="//div[@type='letter'][@n='2']//closer/salute"/></div>
                            <h3><xsl:apply-templates select="//div[@type='letter'][@n='2']//closer/signed"/></h3>
                            <div><xsl:apply-templates select="//div[@type='letter'][@n='2']//postscript"/></div>
                         </div>
                        <div>
                            <xsl:call-template name="notesbp"/>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
        <!-- PAGE DE LA LETTRE 3 -->
        <xsl:result-document href="{$pathlettre3}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$doc_head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="arriere_plan">
                        <div class="page-global">
                            <h1>Lettre n°2</h1>
                            <h1><xsl:apply-templates select="//div[@type='letter'][@n='3']//head"/></h1>
                            <h2><xsl:apply-templates select="//div[@type='letter'][@n='3']//dateline"/></h2>
                            <h3><xsl:apply-templates select="//div[@type='letter'][@n='3']//opener/salute"/></h3>
                            <div>
                                <xsl:apply-templates select="//div[@type='letter'][@n='3']//closer//preceding-sibling::p"/>
                            </div>
                            <div><xsl:apply-templates select="//div[@type='letter'][@n='3']//closer/salute"/></div>
                            <h3><xsl:apply-templates select="//div[@type='letter'][@n='3']//closer/signed"/></h3>
                            <div><xsl:apply-templates select="//div[@type='letter'][@n='3']//postscript"/></div>
                        </div>
                        <div>
                            <xsl:call-template name="notesbp"/>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
              
        <!-- PAGE DES INDEX DES NOMS DE PERSONNES-->
        <xsl:result-document href="{$pathIndexPers}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$doc_head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="arriere_plan">
                        <div class="index-global">
                            <h1>Index des noms de personnes</h1>
                            <div>
                                <p style='margin-bottom: 0.25%'><i>Les numéros et les liens renvoient aux lettres.</i></p>
                            </div>
                            <div class="index">
                            </div>
                            <div>
                                <xsl:call-template name="delaunay"/>
                                <br></br>
                                <xsl:call-template name="nourry"/>
                                <br></br>
                                <xsl:call-template name="autres"/>
                            </div>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>

    
     <!-- PAGE DES INDEX DES NOMS DE LIEUX-->
     <xsl:result-document href="{$pathIndexLieux}" method="html" indent="yes">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="fr">
            <xsl:copy-of select="$doc_head"/>
            <body>
                <xsl:copy-of select="$navheader"/>
                <div class="arriere_plan">
                    <div class="index-global">
                        <h1>Index des noms de personnes</h1>
                        <div>
                            <p style='margin-bottom: 0.25%'><i>Les numéros et les liens renvoient aux lettres.</i></p>
                        </div>
                        <div class="index">
                        </div>
                        <div>
                            <xsl:call-template name="lieuxFrance"/>
                            <br></br>
                            <xsl:call-template name="lieuxetrangers"/>
                        </div>
                    </div>
                </div>
                <xsl:copy-of select="$footer"/>
            </body>
          </html>
    </xsl:result-document>
        
        <!-- PAGE DES INDEX DES NOMS D'ORGANISMES-->
        <xsl:result-document href="{$pathIndexOrg}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$doc_head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="arriere_plan">
                        <div class="index-global">
                            <h1>Index des noms d'organismes</h1>
                            <div>
                                <p style='margin-bottom: 0.25%'><i>Les numéros et les liens renvoient aux lettres.</i></p>
                            </div>
                            <div class="index">
                            </div>
                            <div>
                                <xsl:call-template name="compagniedisques"/>
                                <br></br>
                                <xsl:call-template name="marquedisques"/>
                                <br></br>
                                <xsl:call-template name="magazine"/>
                                <br></br>
                                <xsl:call-template name="radio"/>
                            </div>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
   </xsl:template>


    
    <!-- RÈGLES POUR LE TEXTE -->
    <xsl:template match="//body//p" mode="#all">
        <!-- match uniquement sur les <p> du <body> -->
        <xsl:element name="p">
            <xsl:attribute name="style">
                <xsl:text>line-height: 2; text-indent: 10%;</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="id">
                <!-- attributs @id vers lesquels pointeront les liens de l'index (format : id=div\d)  -->
                <xsl:text>div</xsl:text>
                <xsl:number count="div[@type='letter']" format="1" level="single"/>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element> 
    </xsl:template>
    
    <!-- RÈGLES DES NOTES -->
    <xsl:template match="note[@type='edition_electronique']" mode="#all">
        <!-- Règle pour faire les appels de note en exposant -->
        <xsl:element name="sup">
            <xsl:attribute name="style">
                <xsl:text>font-size: 10pt;</xsl:text>
            </xsl:attribute>
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <!-- @href afin de faire le lien vers le texte de la note, son contenu est le numéro de la note (@n) -->
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="./@n"/>
                </xsl:attribute>
                <!-- texte de l'appel de note : son numéro (@n) -->
                <xsl:value-of select="./@n"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template name="notesbp">
        <!-- Règle pour le texte des notes sous le texte -->
        <xsl:for-each select="/TEI/text/body/div/p/note">
            <xsl:element name="p">
                <xsl:attribute name="id">
                    <!-- @id = ancre pour le lien de @href établi dans la règle précédente -->
                    <xsl:value-of select="./@n"/>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:text>notes-p</xsl:text>
                </xsl:attribute>
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:text>#</xsl:text>
                        <xsl:value-of select="./@n"/>
                    </xsl:attribute>
                    <!-- commence par le numéro de la note (@n) suivi d'un point -->
                    <xsl:value-of select="./@n"/>
                    <xsl:text>. </xsl:text>
                    <!-- texte de la note défini par un apply-templates -->
                </xsl:element>
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:for-each>      
    </xsl:template>
    <xsl:template match="hi[@rend='italic']">
        <!-- règle pour mettre en italique les passages signalées par <hi rend='italic'> -->
        <xsl:element name="i">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- RÈGLES DE L'INDEX DES NOMS DE PERSONNES -->
    <xsl:template name="delaunay">
        <xsl:element name="div">
            <h2>Famille Delaunay</h2>
            <xsl:element name="div">
                <xsl:for-each select="//listPerson[@type='famille_Delaunay']//persName">
                    <!-- tri de A à Z des entrées d'index -->
                    <xsl:sort select="/forename" order="ascending"/>
                    <xsl:element name="p">
                        <xsl:element name="b">
                            <!-- intitulé de l'entrée d'index en bold : prénom suivi du nom ; -->
                            <xsl:value-of select="forename"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="surname"/>
                            <xsl:text> </xsl:text>
                            <xsl:if test="addName">
                                <!-- entre pranthèses : s'il existe, le surnom développé, -->
                                <xsl:value-of select="addName"/>
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:element>
                        <xsl:variable name="idPerson">
                            <!-- variable $idPerson contenant la valeur de l'@xml:id de <person> dans le <particDesc>  -->
                            <xsl:value-of select="parent::person/@xml:id"/>
                        </xsl:variable>
                        <xsl:text> : </xsl:text>
                        <xsl:for-each-group select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]" group-by="ancestor::div/@n">
                            <!-- occurence du nom (<placeName> dans le <body> dont @ref sans le '#' est équivalent à $Personid) groupé par paragraphe (<div> -->
                            <!-- est affichée le numéro de la lettre concernée (@n de <div>) -->
                            <!-- le numéro est un lien qui pointe vers la lettre -->
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>lettre</xsl:text>
                                    <xsl:value-of select="ancestor::div/@n"/>
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="ancestor::div/@n"/>
                            </xsl:element>
                            <!-- occurence suivie par une virgule si elle n'est pas la dernière, par un point si elle l'est -->
                            <xsl:if test="position()!= last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="nourry">
        <xsl:element name="div">
            <h2>Famille Nourry</h2>
            <xsl:element name="div">
                <xsl:for-each select="//listPerson[@type='famille_nourry']//persName">
                    <!-- tri de A à Z des entrées d'index -->
                    <xsl:sort select="/forename" order="ascending"/>
                    <xsl:element name="p">
                        <xsl:element name="b">
                            <!-- intitulé de l'entrée d'index en bold : prénom suivi du nom ; -->
                            <xsl:value-of select="forename"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="surname"/>
                            <xsl:text> </xsl:text>
                            <xsl:if test="addName">
                                <!-- entre pranthèses : s'il existe, le surnom développé, -->
                                <xsl:value-of select="addName"/>
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:element>
                        <xsl:variable name="idPerson">
                            <!-- variable $idPerson contenant la valeur de l'@xml:id de <person> dans le <particDesc>  -->
                            <xsl:value-of select="parent::person/@xml:id"/>
                        </xsl:variable>
                        <xsl:text> : </xsl:text>
                        <xsl:for-each-group select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]" group-by="ancestor::div/@n">
                            <!-- occurence du nom (<placeName> dans le <body> dont @ref sans le '#' est équivalent à $Personid) groupé par paragraphe (<div> -->
                            <!-- est affichée le numéro de la lettre concernée (@n de <div>) -->
                            <!-- le numéro est un lien qui pointe vers la lettre -->
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>lettre</xsl:text>
                                    <xsl:value-of select="ancestor::div/@n"/>
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="ancestor::div/@n"/>
                            </xsl:element>
                            <!-- occurence suivie par une virgule si elle n'est pas la dernière, par un point si elle l'est -->
                            <xsl:if test="position()!= last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
      </xsl:template>
    
    <xsl:template name="autres">
        <xsl:element name="div">
            <h2>Les musiciens et autres personnes</h2>
            <xsl:element name="div">
                <xsl:for-each select="//listPerson[@type='autres']//persName">
                    <!-- tri de A à Z des entrées d'index -->
                    <xsl:sort select="surname" order="ascending"/>
                    <xsl:element name="p">
                        <xsl:element name="b">
                            <!-- intitulé de l'entrée d'index en bold : prénom suivi du nom ; -->
                            <xsl:value-of select="forename"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="surname"/>
                            <xsl:text> </xsl:text>
                            <xsl:if test="addName">
                                <xsl:text>(</xsl:text>
                                <!-- entre pranthèses : s'il existe, le surnom développé, -->
                                <xsl:value-of select="addName"/>
                                <xsl:text>)</xsl:text>
                                <xsl:text>, </xsl:text>
                            </xsl:if>

                        </xsl:element>
                        <xsl:variable name="idPerson">
                            <!-- variable $idPerson contenant la valeur de l'@xml:id de <person> dans le <particDesc>  -->
                            <xsl:value-of select="parent::person/@xml:id"/>
                        </xsl:variable>
                        <xsl:text> : </xsl:text>
                        <xsl:for-each-group select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]" group-by="ancestor::div/@n">
                            <!-- occurence du nom (<placeName> dans le <body> dont @ref sans le '#' est équivalent à $Personid) groupé par paragraphe (<div> -->
                            <!-- est affichée le numéro de la lettre concernée (@n de <div>) -->
                            <!-- le numéro est un lien qui pointe vers la lettre -->
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>lettre</xsl:text>
                                    <xsl:value-of select="ancestor::div/@n"/>
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="ancestor::div/@n"/>
                            </xsl:element>
                            <!-- occurence suivie par une virgule si elle n'est pas la dernière, par un point si elle l'est -->
                            <xsl:if test="position()!= last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <!-- RÈGLES DE L'INDEX DES NOMS DE LIEUX -->
    <xsl:template name="lieuxFrance">
        <xsl:element name="div">
            <h2>France</h2>
            <xsl:element name="div">
                <xsl:for-each select="//listPlace[@type='France']//placeName">
                    <xsl:sort select="placeName" order="ascending"></xsl:sort>                
                    <xsl:element name="p">
                        <xsl:element name="b">
                            <!-- intitulé de l'entrée d'index en bold : le nom du lien en français (name) avec le pays (<country>) -->
                            <xsl:value-of select="."/>
                        </xsl:element>
                        <xsl:variable name="Placeid">
                            <!-- variable $Placeid contenant la valeur de l'@xml:id de <place> dans le <settingDesc>  -->
                            <xsl:value-of select="ancestor::place/@xml:id"/>
                        </xsl:variable>
                        <xsl:text> : </xsl:text>
                        <xsl:for-each-group select="ancestor::TEI//body//placeName[translate(@ref, '#','')=$Placeid]" group-by="ancestor::div/@n">
                            <!-- occurence du nom (<placeName> dans le <body> dont @ref sans le '#' est équivalent à $Placeid) groupé par paragraphe (<div> -->
                            <!-- est affichée le numéro de la lettre concernée (@n de <div>) -->
                            <!-- le numéro est un lien qui pointe vers la lettre -->
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>lettre</xsl:text>
                                    <xsl:value-of select="ancestor::div/@n"/>
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="ancestor::div/@n"/>
                            </xsl:element>
                            <!-- occurence suivie par une virgule si elle n'est pas la dernière, par un point si elle l'est -->
                            <xsl:if test="position()!= last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each-group>
                      </xsl:element>
                  </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
      <xsl:template name="lieuxetrangers">
        <xsl:element name="div">
            <h2>Pays étrangers</h2>
            <xsl:element name="div">
                <xsl:for-each select="//listPlace[@type='Etranger']//placeName">
                    <xsl:sort select="placeName" order="ascending"></xsl:sort>                
                    <xsl:element name="p">
                        <xsl:element name="b">
                            <!-- intitulé de l'entrée d'index en bold : le nom du lien en français (name) avec le pays (<country>) -->
                            <xsl:value-of select="."/>
                        </xsl:element>
                        <xsl:variable name="Placeid">
                            <!-- variable $Placeid contenant la valeur de l'@xml:id de <place> dans le <settingDesc>  -->
                            <xsl:value-of select="ancestor::place/@xml:id"/>
                        </xsl:variable>
                        <xsl:text> : </xsl:text>
                        <xsl:for-each-group select="ancestor::TEI//body//placeName[translate(@ref, '#','')=$Placeid]" group-by="ancestor::div/@n">
                            <!-- occurence du nom (<placeName> dans le <body> dont @ref sans le '#' est équivalent à $Placeid) groupé par paragraphe (<div> -->
                            <!-- est affichée le numéro de la lettre concernée (@n de <div>) -->
                            <!-- le numéro est un lien qui pointe vers la lettre -->
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>lettre</xsl:text>
                                    <xsl:value-of select="ancestor::div/@n"/>
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="ancestor::div/@n"/>
                            </xsl:element>
                            <!-- occurence suivie par une virgule si elle n'est pas la dernière, par un point si elle l'est -->
                            <xsl:if test="position()!= last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>    
    <!-- RÈGLES DE L'INDEX DES NOMS D'ORGANISMES -->
    <xsl:template name="compagniedisques">
        <xsl:element name="div">
            <h2>Les compagnies de disques</h2>
            <xsl:element name="div">
                <xsl:for-each select="//listOrg[@type='phono_company']//orgName">
                    <!-- tri de A à Z des entrées d'index -->
                    <xsl:sort select="/orgName" order="ascending"/>
                    <xsl:element name="p">
                        <xsl:element name="b">
                            <xsl:value-of select="addName"/>
                            <!-- intitulé de l'entrée d'index en bold : prénom suivi du nom ; -->
                        </xsl:element>
                        <xsl:variable name="idOrg">
                            <!-- variable $idPerson contenant la valeur de l'@xml:id de <person> dans le <particDesc>  -->
                            <xsl:value-of select="parent::org/@xml:id"/>
                        </xsl:variable>
                        <xsl:text> : </xsl:text>
                        <xsl:for-each-group select="ancestor::TEI//body//orgName[translate(@ref, '#','')=$idOrg]" group-by="ancestor::div/@n">
                            <!-- occurence du nom (<orgName> dans le <body> dont @ref sans le '#' est équivalent à $Personid) groupé par paragraphe (<div> -->
                            <!-- est affichée le numéro de la lettre concernée (@n de <div>) -->
                            <!-- le numéro est un lien qui pointe vers la lettre -->
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>lettre</xsl:text>
                                    <xsl:value-of select="ancestor::div/@n"/>
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="ancestor::div/@n"/>
                            </xsl:element>
                            <!-- occurence suivie par une virgule si elle n'est pas la dernière, par un point si elle l'est -->
                            <xsl:if test="position()!= last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
       </xsl:element>
    </xsl:template>
    <xsl:template name="marquedisques">
        <xsl:element name="div">
            <h2>Les marques de disques</h2>
            <xsl:element name="div">
                <xsl:for-each select="//listOrg[@type='record_company']//orgName">
                    <!-- tri de A à Z des entrées d'index -->
                    <xsl:sort select="/orgName" order="ascending"/>
                    <xsl:element name="p">
                        <xsl:element name="b">
                            <xsl:value-of select="addName"/>
                            <!-- intitulé de l'entrée d'index en bold : prénom suivi du nom ; -->
                            <xsl:text> </xsl:text>
                        </xsl:element>
                        <xsl:variable name="idOrg">
                            <!-- variable $idPerson contenant la valeur de l'@xml:id de <person> dans le <particDesc>  -->
                            <xsl:value-of select="parent::org/@xml:id"/>
                        </xsl:variable>
                        <xsl:text> : </xsl:text>
                        <xsl:for-each-group select="ancestor::TEI//body//orgName[translate(@ref, '#','')=$idOrg]" group-by="ancestor::div/@n">
                            <!-- occurence du nom (<orgName> dans le <body> dont @ref sans le '#' est équivalent à $Personid) groupé par paragraphe (<div> -->
                            <!-- est affichée le numéro de la lettre concernée (@n de <div>) -->
                            <!-- le numéro est un lien qui pointe vers la lettre -->
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>lettre</xsl:text>
                                    <xsl:value-of select="ancestor::div/@n"/>
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="ancestor::div/@n"/>
                            </xsl:element>
                            <!-- occurence suivie par une virgule si elle n'est pas la dernière, par un point si elle l'est -->
                            <xsl:if test="position()!= last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template name="magazine">
        <xsl:element name="div">
            <h2>Les journaux de jazz</h2>
            <xsl:element name="div">
                <xsl:for-each select="//listOrg[@type='magazine']//orgName">
                    <!-- tri de A à Z des entrées d'index -->
                    <xsl:sort select="/orgName" order="ascending"/>
                    <xsl:element name="p">
                        <xsl:element name="b">
                            <xsl:value-of select="addName"/>
                            <!-- intitulé de l'entrée d'index en bold : prénom suivi du nom ; -->
                            <xsl:text> </xsl:text>
                        </xsl:element>
                        <xsl:variable name="idOrg">
                            <!-- variable $idPerson contenant la valeur de l'@xml:id de <person> dans le <particDesc>  -->
                            <xsl:value-of select="parent::org/@xml:id"/>
                        </xsl:variable>
                        <xsl:text> : </xsl:text>
                        <xsl:for-each-group select="ancestor::TEI//body//orgName[translate(@ref, '#','')=$idOrg]" group-by="ancestor::div/@n">
                            <!-- occurence du nom (<orgName> dans le <body> dont @ref sans le '#' est équivalent à $Personid) groupé par paragraphe (<div> -->
                            <!-- est affichée le numéro de la lettre concernée (@n de <div>) -->
                            <!-- le numéro est un lien qui pointe vers la lettre -->
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>lettre</xsl:text>
                                    <xsl:value-of select="ancestor::div/@n"/>
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="ancestor::div/@n"/>
                            </xsl:element>
                            <!-- occurence suivie par une virgule si elle n'est pas la dernière, par un point si elle l'est -->
                            <xsl:if test="position()!= last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template name="radio">
        <xsl:element name="div">
            <h2>Les radios</h2>
            <xsl:element name="div">
                <xsl:for-each select="//listOrg[@type='radio']//orgName">
                    <!-- tri de A à Z des entrées d'index -->
                    <xsl:sort select="/orgName" order="ascending"/>
                    <xsl:element name="p">
                        <xsl:element name="b">
                            <xsl:value-of select="addName"/>
                            <!-- intitulé de l'entrée d'index en bold : prénom suivi du nom ; -->
                            <xsl:text> </xsl:text>
                        </xsl:element>
                        <xsl:variable name="idOrg">
                            <!-- variable $idPerson contenant la valeur de l'@xml:id de <person> dans le <particDesc>  -->
                            <xsl:value-of select="parent::org/@xml:id"/>
                        </xsl:variable>
                        <xsl:text> : </xsl:text>
                        <xsl:for-each-group select="ancestor::TEI//body//orgName[translate(@ref, '#','')=$idOrg]" group-by="ancestor::div/@n">
                            <!-- occurence du nom (<orgName> dans le <body> dont @ref sans le '#' est équivalent à $Personid) groupé par paragraphe (<div> -->
                            <!-- est affichée le numéro de la lettre concernée (@n de <div>) -->
                            <!-- le numéro est un lien qui pointe vers la lettre -->
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>lettre</xsl:text>
                                    <xsl:value-of select="ancestor::div/@n"/>
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="ancestor::div/@n"/>
                            </xsl:element>
                            <!-- occurence suivie par une virgule si elle n'est pas la dernière, par un point si elle l'est -->
                            <xsl:if test="position()!= last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
