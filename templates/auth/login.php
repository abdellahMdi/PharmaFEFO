<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-900">
<head>
    <meta charset="UTF-8">
    <title>PharmaFEFO - Connexion</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="h-full flex items-center justify-center px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8 bg-white p-8 rounded-2xl shadow-xl">
        <div>
            <div class="flex justify-center text-emerald-500 text-5xl mb-4">
                <i class="fa-solid fa-prescription-bottle-medical"></i>
            </div>
            <h2 class="text-center text-3xl font-extrabold text-slate-900">Pharma<span class="text-emerald-500">FEFO</span></h2>
            <p class="mt-2 text-center text-sm text-slate-600">Gestion de stock sécurisée par traçabilité d'expiration</p>
        </div>
        <form class="mt-8 space-y-6" action="/login" method="POST">
            <div class="rounded-md shadow-sm space-y-4">
                <div>
                    <label for="email" class="block text-sm font-medium text-slate-700 mb-1">Adresse Email</label>
                    <input id="email" name="email" type="email" required class="appearance-none rounded-lg relative block w-full px-3 py-2.5 border border-slate-300 placeholder-slate-400 text-slate-900 focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 text-sm" placeholder="pharmacien@pharmafefo.ma">
                </div>
                <div>
                    <label for="password" class="block text-sm font-medium text-slate-700 mb-1">Mot de passe</label>
                    <input id="password" name="password" type="password" required class="appearance-none rounded-lg relative block w-full px-3 py-2.5 border border-slate-300 placeholder-slate-400 text-slate-900 focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 text-sm" placeholder="••••••••">
                </div>
            </div>
            <div>
                <button type="submit" class="group relative w-full flex justify-center py-2.5 px-4 border border-transparent text-sm font-semibold rounded-lg text-white bg-emerald-600 hover:bg-emerald-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-emerald-500 transition-colors">
                    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                        <i class="fa-solid fa-lock text-emerald-500 group-hover:text-emerald-400"></i>
                    </span>
                    Se connecter
                </button>
            </div>
        </form>
    </div>
</body>
</html>