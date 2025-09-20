# Quadrapp - Mobile App

Aplicación móvil Flutter para gestión de estacionamiento con Clean Architecture.

## Instalación

1. Clonar el repositorio
```bash
git clone https://github.com/Experiemtos-SI0732-Group-3-PCC-Team/Quadrapp-Frontend-Mobile.git
cd Quadrapp-Frontend-Mobile
```

2. Instalar dependencias
```bash
flutter pub get
```

3. Ejecutar la aplicación
```bash
flutter run -d chrome
```

## Credenciales de prueba

- Email: `admin@quadrapp.com`
- Contraseña: `123456`

## Tecnologías

- Flutter 3.0+
- Clean Architecture
- Provider (State Management)

## Características

- Splash screen con animaciones
- Login con validaciones
- Diseño responsive
- Componentes reutilizables

## Estructura del proyecto

lib/
├── src/
│   ├── core/                 # Configuraciones y constantes
│   │   └── constants/        # Colores, tipografía, dimensiones
│   ├── domain/              # Lógica de negocio
│   │   ├── entities/        # Entidades del dominio
│   │   ├── repositories/    # Contratos de repositorios
│   │   └── usecases/       # Casos de uso
│   ├── data/               # Capa de datos
│   │   ├── models/         # Modelos de datos
│   │   └── repositories/   # Implementación de repositorios
│   └── presentation/       # Capa de presentación
│       ├── components/     # Componentes reutilizables
│       ├── screens/        # Pantallas de la app
│       └── theme/          # Configuración de tema
└── main.dart              # Punto de entrada


## Paleta de colores

- Morado Principal: #9810FA
- Morado Secundario: #C27AFF
- Naranja Logo: #FF6B35 a #FF4500
- Fondo: Negro/Blanco según el tema

**Grupo 3 - PCC Team** | Diseño de experimentos de software
