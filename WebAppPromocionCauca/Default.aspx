<%@ Page Title="Turismo Cauca" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebAppPromocionCauca._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* ESTILOS ESPECÍFICOS DE LA INTERFAZ INMERSIVA */
        .hero-section {
            height: 70vh;
            background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)), url('https://unsplash.com') no-repeat center center/cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: #FFFFFF;
            margin-top: -20px; /* Ajuste para pegar al menú superior */
            padding: 0 2rem;
        }

        .hero-section h1 {
            font-size: 3.5rem;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.6);
        }

        .hero-section p {
            font-size: 1.4rem;
            max-width: 700px;
            margin-bottom: 2rem;
        }

        .grilla-destinos {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2.5rem;
            margin-top: 3rem;
        }

        .tarjeta-destino {
            background-color: #FFFFFF;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s;
        }

        .tarjeta-destino:hover {
            transform: translateY(-5px);
        }

        .tarjeta-img {
            height: 240px;
            background-size: cover;
            background-position: center;
        }

        .tarjeta-cuerpo {
            padding: 1.5rem;
        }

        .btn-enlace {
            background: none;
            border: none;
            padding: 0;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
        }
    </style>

    <!-- HERO SECTION INMERSIVO -->
    <header class="hero-section">
        <h1>Descubre la Magia del Cauca</h1>
        <p>Un territorio de contrastes donde la historia colonial se funde con la fuerza de la naturaleza y sus saberes ancestrales.</p>
        <asp:Button ID="btnExplorar" runat="server" Text="Explorar Rutas" CssClass="btn btn-lg btn-cauca-principal" OnClick="btnExplorar_Click" />
    </header>

    <!-- SECCIÓN DE DESTINOS IMPERDIBLES -->
    <div class="container my-5">
        <div class="text-center">
            <h2 style="color: var(--verde-paramo); font-weight: 700;">Destinos Imperdibles</h2>
            <div style="width: 60px; height: 3px; background-color: var(--terracota); margin: 0.5rem auto 0;"></div>
        </div>
        
        <div class="grilla-destinos">
            <!-- Popayán -->
            <article class="tarjeta-destino">
                <div class="tarjeta-img" style="background-image: url('https://unsplash.com');"></div>
                <div class="tarjeta-cuerpo">
                    <h3>Popayán Colonial</h3>
                    <p class="text-muted">Camina por las calles empedradas de la "Ciudad Blanca". Explora sus imponentes templos e iglesias y vive de cerca la tradición de su arquitectura.</p>
                    <asp:LinkButton ID="lnkPopayan" runat="server" CssClass="btn-enlace text-cauca-terracota" CommandArgument="Popayan" OnClick="lnkDestino_Click">Ver más →</asp:LinkButton>
                </div>
            </article>

            <!-- Puracé -->
            <article class="tarjeta-destino">
                <div class="tarjeta-img" style="background-image: url('https://unsplash.com');"></div>
                <div class="tarjeta-cuerpo">
                    <h3>PNN Puracé & Macizo</h3>
                    <p class="text-muted">Adéntrate en los senderos de alta montaña. Observa el majestuoso vuelo del cóndor de los Andes entre valles de frailejones y termales azufrados.</p>
                    <asp:LinkButton ID="lnkPurace" runat="server" CssClass="btn-enlace text-cauca-terracota" CommandArgument="Purace" OnClick="lnkDestino_Click">Ver más →</asp:LinkButton>
                </div>
            </article>

            <!-- Silvia / Tierradentro -->
            <article class="tarjeta-destino">
                <div class="tarjeta-img" style="background-image: url('https://unsplash.com');"></div>
                <div class="tarjeta-cuerpo">
                    <h3>Cultura y Saberes</h3>
                    <p class="text-muted">Conéctate con la riqueza multicultural. Desde los mercados tradicionales de Silvia hasta el misticismo arqueológico de las tumbas de Tierradentro.</p>
                    <asp:LinkButton ID="lnkCultura" runat="server" CssClass="btn-enlace text-cauca-terracota" CommandArgument="Cultura" OnClick="lnkDestino_Click">Ver más →</asp:LinkButton>
                </div>
            </article>
        </div>
    </div>

</asp:Content>
