<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YatraConnect - Discover Nepal's Hidden Treasures</title>
    <meta name="description" content="Nepal's premier travel platform. Connect with verified agencies, book hotels, treks and tours across the Himalayas.">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'primary': '#0D3B66',      // Yale Blue
                        'primary-dark': '#0A2C4D', // Darker Blue
                        'primary-light': '#145591',// Lighter Blue
                        'accent': '#C5A059',       // Keep Gold for highlights
                        'bg-light': '#FAF0CA',     // Lemon Chiffon
                        'bg-dark': '#07203B',      // Very Dark Blue Background
                    },
                    fontFamily: {
                        'display': ['Plus Jakarta Sans', 'sans-serif'],
                        'serif': ['Playfair Display', 'serif'],
                    },
                    letterSpacing: {
                        'ultra': '0.25em',
                    }
                }
            }
        }
    </script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Playfair+Display:ital,wght@0,400;0,700;0,800;1,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        * { scroll-behavior: smooth; }
        body { font-family: 'Plus Jakarta Sans', sans-serif; overflow-x: hidden; }
        .no-scrollbar::-webkit-scrollbar { display: none; }
        .no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
        .glass-badge { background: rgba(255,255,255,0.85); backdrop-filter: blur(8px); border: 1px solid rgba(255,255,255,0.5); }
        .map-pin-glow { box-shadow: 0 0 15px #C5A059, 0 0 30px #C5A059; }
        .hover-underline-gold { position: relative; }
        .hover-underline-gold::after { content: ''; position: absolute; width: 100%; transform: scaleX(0); height: 1px; bottom: -2px; left: 0; background-color: #C5A059; transform-origin: bottom right; transition: transform 0.4s cubic-bezier(0.4,0,0.2,1); }
        .hover-underline-gold:hover::after { transform: scaleX(1); transform-origin: bottom left; }
        @keyframes marquee-left { 0%{transform:translateX(0)} 100%{transform:translateX(calc(-50% - 12px))} }
        @keyframes marquee-right { 0%{transform:translateX(calc(-50% - 12px))} 100%{transform:translateX(0)} }
        .animate-marquee-left { animation: marquee-left 40s linear infinite; }
        .animate-marquee-right { animation: marquee-right 40s linear infinite; }
        @keyframes fadeInUp { from{opacity:0;transform:translateY(30px)} to{opacity:1;transform:translateY(0)} }
        .fade-in-up { animation: fadeInUp 0.8s ease-out forwards; }
        .fade-in-up-delay-1 { animation: fadeInUp 0.8s ease-out 0.15s forwards; opacity:0; }
        .fade-in-up-delay-2 { animation: fadeInUp 0.8s ease-out 0.3s forwards; opacity:0; }
    </style>
</head>
<body class="bg-[#FAF0CA] text-gray-800 antialiased">
