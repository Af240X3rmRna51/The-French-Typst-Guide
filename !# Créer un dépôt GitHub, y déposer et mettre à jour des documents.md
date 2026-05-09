## ==Créer un dépôt GitHub, y déposer et mettre à jour des documents==

------

## Phase 1 — Préparer Git sur Fedora 43

**Étape 1 — Vérifier que Git est installé**

```bash
git --version
```

Si non installé :

```bash
sudo dnf install git
```

**Étape 2 — Configurer ton identité Git**

```bash
git config --global user.name "Alain"
git config --global user.email "a.chs@etik.com"
```

Vérifier :

```bash
git config --list
```

------

## Phase 2 — Créer le dépôt sur GitHub

**Étape 3 — Créer un compte GitHub** si pas déjà fait sur `github.com`

**Étape 4 — Créer le dépôt**

- Clic sur **"New repository"**
- Nom : `The-French-Typst-Guide`
- Description : `Guide complet Typst en français — Fedora 43 KDE`
- Visibilité : **Public**
- **Ne pas** cocher "Add a README" — tu en as déjà un
- Clic **"Create repository"**

GitHub t'affiche alors une page avec des instructions — **garde cette page ouverte**, tu en auras besoin à l'étape suivante.

------

## Phase 3 — Préparer ton dossier local

**Étape 5 — Organiser les fichiers**

Crée un dossier dédié :

```bash
mkdir -p ~/The-French-Typst-Guide
cd ~/The-French-Typst-Guide
```

Copie tes fichiers dedans :

```bash
cp /chemin/vers/GUIDE.typ .
cp /chemin/vers/commun.typ .
cp /chemin/vers/README.md .
```

Vérifie le contenu :

```bash
ls -lh
```

Tu dois voir :

```
README.md
GUIDE.typ
commun.typ
```

**Étape 6 — Initialiser le dépôt Git local**

```bash
git init
git branch -M main
```

------

## Phase 4 — Connecter au dépôt GitHub

**Étape 7 — Générer une clé SSH** (méthode recommandée — pas de mot de passe à taper)

```bash
ssh-keygen -t ed25519 -C "ton@email.fr"
```

Appuie sur **Entrée** trois fois pour accepter les valeurs par défaut.

**Étape 8 — Afficher la clé publique**

```bash
cat ~/.ssh/id_ed25519.pub
```

Copie **toute la ligne** affichée.

**Étape 9 — Ajouter la clé sur GitHub**

- GitHub → **Settings** → **SSH and GPG keys**
- Clic **"New SSH key"**
- Title : `Fedora 43 KDE`
- Colle ta clé publique
- Clic **"Add SSH key"**

**Étape 10 — Tester la connexion**

```bash
ssh -T git@github.com
```

Tu dois voir :

```
Hi Alain! You've successfully authenticated...
```

------

## Phase 5 — Premier push

**Étape 11 — Lier le dépôt local au dépôt GitHub**

```bash
git remote add origin git@github.com:TON-USERNAME/The-French-Typst-Guide.git
```

Remplace `TON-USERNAME` par ton nom d'utilisateur GitHub exact.

**Étape 12 — Premier commit et push**

```bash
git add .
git commit -m "Premier commit — Guide complet Typst en français v1.0"
git push -u origin main
```

Vérifie sur GitHub — tes trois fichiers doivent apparaître. 🎉

------

## Phase 6 — Le script de mise à jour

**Étape 13 — Créer le script Bash**

```bash
nano ~/The-French-Typst-Guide/push_guide.sh
```

Contenu du script :

```bash
#!/bin/bash
# ══════════════════════════════════════════════
#  push_guide.sh — Mise à jour GitHub automatique
#  The-French-Typst-Guide
#  Usage : ./push_guide.sh "Message de commit"
# ══════════════════════════════════════════════

set -e  # Arrêter en cas d'erreur

REPO_DIR="$HOME/The-French-Typst-Guide"
DATE=$(date '+%Y-%m-%d %H:%M')
MSG="${1:-Mise à jour du $DATE}"

echo "═══════════════════════════════════════"
echo "  Push vers GitHub — $DATE"
echo "═══════════════════════════════════════"

# Aller dans le dossier du dépôt
cd "$REPO_DIR"

# Vérifier s'il y a des changements
if git diff --quiet && git diff --staged --quiet; then
    echo "✓ Aucun changement détecté — rien à pousser."
    exit 0
fi

# Ajouter tous les fichiers modifiés
git add .

# Commit avec le message
git commit -m "$MSG"

# Push vers GitHub
git push origin main

echo ""
echo "✓ Push réussi : $MSG"
echo "═══════════════════════════════════════"
```

**Étape 14 — Rendre le script exécutable**

```bash
chmod +x ~/The-French-Typst-Guide/push_guide.sh
```

**Étape 15 — Utilisation au quotidien**

```bash
# Sans message personnalisé — date automatique
./push_guide.sh

# Avec message personnalisé
./push_guide.sh "Ajout de 5 nouvelles fiches encyclopédie"
./push_guide.sh "Correction fascicule 08 — formules Schrödinger"
```

------

## Récapitulatif des commandes du quotidien

```bash
cd ~/The-French-Typst-Guide   # aller dans le dossier
cp /nouveau/fichier.typ .      # copier un nouveau fichier
./push_guide.sh "Description"  # pousser sur GitHub
```

**Une seule règle à retenir :** chaque fois que tu modifies un fichier ou en ajoutes un nouveau — copie-le dans `~/The-French-Typst-Guide` puis lance `./push_guide.sh`. C'est tout. 🎨