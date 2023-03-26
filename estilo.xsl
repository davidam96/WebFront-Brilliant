<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet  [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY ldquo  "&#8220;">
	<!ENTITY rdquo  "&#8221;"> 
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">

<html lang="en">

<head>
  <title>Brilliant</title>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
  <!-- Mi css -->
  <link rel="stylesheet" href="/css/mycss.css" />
</head>

<body>
  <!-- CABECERA -->
  <div id="cabecera" class="container-fluid bg-white fixed-top border-bottom">
    <nav class="navbar navbar-expand-lg navbar-light bg-migris">
      <img src="img/logo_brilliant.png" alt="brilliant_logo" />
      <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
        aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="collapsibleNavId">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
          <li class="nav-item mr-5">
            <a class="nav-link text-migris" href="#">TODAY</a>
          </li>
          <li class="nav-item mr-5">
            <a class="nav-link text-minegro" href="#">COURSES</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle mr-5" href="#" id="dropdownId" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">PRACTICE</a>
            <div class="dropdown-menu" style="width:580px" aria-labelledby="dropdownId">
              <div class="row">
                <xsl:for-each select="brilliant/practice/curso">
                  <div class="col-md-6">
                    <a class="dropdown-item mr-md-5 opacity" href="#">
                      <img src="{icono}" class="rounded mr-4" alt="{icono/@desc}" />
                      <p class="my-0 d-inline bold">
                        <xsl:value-of select="nombre"></xsl:value-of>
                      </p>
                    </a>
                  </div>
                </xsl:for-each>
              </div>
            </div>
          </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <p id="botones" class="text-left text-lg-right my-0">
            <button class="btn btn-outline-primary mr-3 my-1" type="submit">Log In</button>
            <button class="btn bg-primary text-white mr-3" type="submit">Sign Up</button>
          </p>
        </form>
      </div>
    </nav>
  </div>

  <!-- POPULARES -->
  <div id="populares" class="text-white fondo bg-oscuro py-5">
    <div class="micontainer">
      <div class="texto-cab1 mx-2">Popular Courses ✨</div>
      <div class="texto-cab2 mx-2">Popular with our users in the last month</div>
      <div class="row pb-5">
        <xsl:for-each select="brilliant/populares/curso">
          <!-- uso de xsl:sort -->
          <xsl:sort select="nombre" data-type="text" order="descending" />
          <div class="col-12 col-sm-6 col-lg-3 my-3 px-0">
            <div class="card card-minegro mx-2 my-2 py-4">
              <img class="card-img-top position-relative" src="{imagen}" alt="{imagen/@desc}" />
              <div class="card-body">
                <h4 class="card-title card-mititulo pt-3">
                  <xsl:value-of select="nombre"></xsl:value-of>
                </h4>
                <p class="card-text position-absolute">
                  <xsl:value-of select="descripcion"></xsl:value-of>
                </p>
              </div>
            </div>
          </div>
        </xsl:for-each>
      </div>
    </div>
  </div>

  <!-- CURSOS -->
  <div id="stickybox" class="sticky-top">
    <nav class="navbar navbar-expand-sm navbar-light bg-light">
      <a class="navbar-brand" href="#">Browse All 60+ Courses</a>
      <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#secciones"
        aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse ml-5" id="secciones">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
          <li class="nav-item mr-3">
            <a class="nav-link mitexto" href="#{brilliant/cursos/categoria/@nombre[1]}">Math</a>
          </li>
          <li class="nav-item mr-3">
            <a class="nav-link mitexto" href="#{brilliant/cursos/categoria[9]/@nombre}">Science</a>
          </li>
          <li class="nav-item mr-3">
            <a class="nav-link mitexto" href="#{brilliant/cursos/categoria[13]/@nombre}">Computer Science</a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
  <div id="cursos" class="micontainer mb-5">
    <xsl:for-each select="brilliant/cursos/categoria">
      <p id="categoria" class="position-absolute pr-3">
        <xsl:value-of select="@nombre"></xsl:value-of>
      </p>
      <a name="{@nombre}" class="miposicion"></a>
      <div class="miborde my-5"></div>
      <div class="row">
        <xsl:for-each select="curso">
          <div class="col-12 col-sm-6 col-lg-3 col-xl-2 px-0 pr-4 my-2">
            <div class="card">
              <img class="card-img-top" src="{imagen}" alt="{nombre}" />
              <div class="card-body">
                <h4 class="card-title">
                  <xsl:value-of select="nombre"></xsl:value-of>
                </h4>
                <p class="card-text">
                  <xsl:value-of select="descripcion"></xsl:value-of>
                  <!-- uso de xsl:if -->
                  <xsl:if test="descripcion='Coming soon.'">
                    <button type="button" class="btn miboton">Notify Me</button>
                  </xsl:if>
                </p>
              </div>
            </div>
          </div>
        </xsl:for-each>
      </div>
    </xsl:for-each>
  </div>
  

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
</body>

</html>

</xsl:template>
</xsl:stylesheet>