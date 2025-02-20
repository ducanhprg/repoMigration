# 🛠 GitHub to GitLab Migration Script

This script automates the process of **migrating repositories from GitHub to GitLab** using `git clone --mirror`. It ensures that **all branches, tags, and history** are transferred.

## 🚀 Features

✅ Fully **automated migration** process  
✅ Transfers **all branches and tags**  
✅ Works with **SSH-based authentication**  
✅ Cleans up cloned repositories after migration  

---

## 📌 Prerequisites

Before running the script, ensure you have:

1. **Git installed**  

   ```sh
   git --version

   ```

   If not installed, install it via:
   - Ubuntu/Debian: `sudo apt install git`
   - macOS: `brew install git`
   - Windows: [Download Git](https://git-scm.com/downloads)

2. **SSH authentication set up** for GitHub and GitLab:
   - [Generate an SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) if not already set up.
   - Add the key to both **GitHub** and **GitLab**.

3. **A file (`repos.txt`) with your repository list**, formatted as:

   ```txt
   git@github.com:YOUR_GITHUB_USERNAME/FROM_REPO.git git@gitlab.com:YOUR_GITLAB_USERNAME/TO_REPO.git
   ```

---

## 📌 Installation & Usage

### 1️⃣ **Clone this script**

```sh
git clone git@github.com:ducanhprg/repoMigration.git
cd repoMigration
```

### 2️⃣ **Prepare the `repos.txt` file**

- Edit `repos.txt` to list repositories for migration.
- Each line follows this format:

  ```txt
  git@github.com:YOUR_GITHUB_USERNAME/REPO_NAME.git git@gitlab.com:YOUR_GITLAB_USERNAME/REPO_NAME.git
  ```

### 3️⃣ **Run the migration script**

```sh
chmod +x migrate_repos.sh  # Give execute permissions
./migrate_repos.sh
```

### 4️⃣ **Wait for completion**

After the script finishes, all repositories will be migrated to GitLab.

---

## 🛠 Troubleshooting

### ❓ GitHub/GitLab authentication issues?

- Ensure your **SSH key is added** to GitHub & GitLab.
- Run `ssh -T git@github.com` and `ssh -T git@gitlab.com` to verify.

### ❓ `git push --mirror` rejected due to protected branches?

- Disable protected branches in **GitLab**:
  1. Go to **GitLab > Settings > Repository**.
  2. Find **Protected branches**.
  3. Click **Unprotect** on the main branches.
  4. Run the script again.

### ❓ `repos.txt` not found?

- Ensure it's in the same directory as `migrate_repos.sh`.

---

## 📜 License

This project is licensed under the **MIT License**.

---
👨‍💻 **Created by Derek** | 🚀 Happy coding!
