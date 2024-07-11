
Ce repo illustre la conférence ci-dessous avec un exemple concret :

[https://www.youtube.com/watch?v=v_RzIPS72E0](https://www.youtube.com/watch?v=v_RzIPS72E0)

# Exercice

Trouver la vulnérabilité dans le code source de ce repo, sans s'aider d'un outil...

# Utilisation de semgrep

[https://semgrep.dev/docs/getting-started/quickstart](https://semgrep.dev/docs/getting-started/quickstart)

```
podman container run --rm semgrep/semgrep semgrep --version
podman container run -it semgrep/semgrep semgrep login
```
-> retourne le token `YOUR_TOKEN`.
```
podman container  run -e SEMGREP_APP_TOKEN=YOUR_TOKEN --rm -v "${PWD}:/src" semgrep/semgrep semgrep ci
```

Résultat sur [https://semgrep.dev](https://semgrep.dev) :

![démo semgrep](./docs/demo_semgrep.gif?raw=true)

## Comparaison de semgrep avec d'autres outils

| outil | vulnérabilité détectée | niveau de détail |
| --- | --- | --- |
| sonarcloud standard | ❌ [démo](./docs/demo_sonarcloud_standard.webm) | ❌ |
| dependabot GitHub | ✅ | bof [démo](https://github.com/avergnaud/meetup-25-aout/security/dependabot/1) |
| OWASP dependency check [démo exec](./docs/odc_exec.webm) | ✅ | bof [démo résultat](./docs/odc_resultat.webm) |
| semgrep | ✅ | ✅ donne la ligne |

# L'application (Next.JS) qui sert d'exemple...

This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.js`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/basic-features/font-optimization) to automatically optimize and load Inter, a custom Google Font.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js/) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/deployment) for more details.
