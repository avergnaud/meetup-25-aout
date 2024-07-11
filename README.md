
Ce repo illustre la conférence ci-dessous avec des exemples concrets.

[https://www.youtube.com/watch?v=v_RzIPS72E0](https://www.youtube.com/watch?v=v_RzIPS72E0)

# Etat du code

* Une vulnérabilité SSRF (la même que [https://github.com/avergnaud/csr-rsc-ssg-isr-ssr-ssrf#ssrf-fixed-in-nextjs-v1411](https://github.com/avergnaud/csr-rsc-ssg-isr-ssr-ssrf#ssrf-fixed-in-nextjs-v1411))
* Une vulnérabilité XSS discutable / discutée par Vercel
* Une vulnérabilité XSS avec `dangerouslySetInnerHTML`

## L'application (Next.JS) qui sert d'exemple...

This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

### Getting Started

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

# Utilisation de theodo RisXSS

[https://github.com/theodo/RisXSS](https://github.com/theodo/RisXSS)

## Exemple non détecté

Discuté : [https://github.com/vercel/next.js/issues/50093](https://github.com/vercel/next.js/issues/50093)

-> Exfiltration des cookies et vol de session. Cf [https://github.com/owasp-training/1-dom-xss/blob/main/README-fr.md](https://github.com/owasp-training/1-dom-xss/blob/main/README-fr.md)

![eslint ko](./docs/xss_eslint_1_ko.png?raw=true)

## Exemple détecté

```
<div dangerouslySetInnerHTML={{
  __html: "<img src='x' onerror='javascript:alert(1)' />"
}}>
</div>
```

![eslint ok](./docs/xss_eslint_2_ok.png?raw=true)