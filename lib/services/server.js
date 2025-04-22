const express = require("express");
const bodyParser = require("body-parser");
const paypal = require("@paypal/checkout-server-sdk");
const axios = require("axios"); // Importa axios

const app = express();
app.use(bodyParser.json());

// Configuración del cliente PayPal
const environment = new paypal.core.SandboxEnvironment(
  "AQELFEkeAw4Ija2q5crciv6lJwN-KW3BMXklBFyUnRAeWhYiyx-ZpKaXAWp4x-XJfexvrwWs0DCC45LS", // Client ID
  "YOUR_SECRET" // Secret
);
const client = new paypal.core.PayPalHttpClient(environment);

// Endpoint para crear una orden
app.post("/create-order", async (req, res) => {
  const request = new paypal.orders.OrdersCreateRequest();
  request.prefer("return=representation");
  request.requestBody({
    intent: "CAPTURE",
    purchase_units: [
      {
        amount: {
          currency_code: "USD",
          value: "98.00", // Precio del producto
        },
      },
    ],
  });

  try {
    const order = await client.execute(request);
    res.json({ id: order.result.id });
  } catch (err) {
    res.status(500).send(err.message);
  }
});

// Endpoint para capturar el pago
app.post("/capture-order", async (req, res) => {
  const { orderID } = req.body;
  const request = new paypal.orders.OrdersCaptureRequest(orderID);
  request.requestBody({});

  try {
    const capture = await client.execute(request);
    res.json(capture.result);
  } catch (err) {
    res.status(500).send(err.message);
  }
});

// Endpoint para iniciar sesión
app.post("/login", async (req, res) => {
  const { username, password } = req.body;

  try {
    // Realiza una solicitud a la API de WordPress para autenticar al usuario
    const response = await axios.post(
      "https://americanstore04.shop/wp-json/jwt-auth/v1/token",
      {
        username,
        password,
      }
    );

    // Devuelve el token JWT al cliente
    res.json({
      token: response.data.token,
      user: response.data.user_display_name,
    });
  } catch (err) {
    // Maneja errores de autenticación
    res.status(err.response?.status || 500).json({
      message: err.response?.data?.message || "Error al iniciar sesión",
    });
  }
});

app.listen(3000, () => {
  console.log("Servidor escuchando en http://localhost:3000");
});