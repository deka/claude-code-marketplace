---
name: linkedin-create-post
description: Write a technical LinkedIn post to promote an open source project. Use when the user asks to write, create, or prepare a LinkedIn post, or mentions a LinkedIn publication.
---

# Technical LinkedIn Post

## Required Input

| Parameter | Description |
|-----------|-------------|
| **language** | The language to write the post in (e.g. French, English, Spanish). **Required.** |

## Instructions

Write a LinkedIn post that promotes a technical open source project. The post must be professional, accessible, and make people want to click the link. **The post must be written in the language specified by the `language` parameter.**

## Format Constraints

- **Length**: ~600–900 characters — neither an article nor a tweet
- **Paragraphs**: short (1–2 sentences), separated by line breaks
- **Hook**: no markdown heading — the first paragraph is an open-ended question
- **Hashtags**: prefix with `hashtag#`; underscores for compound terms (`hashtag#Token_Exchange`) except single words (`hashtag#Keycloak`)
- **Links**: prefer a shortened link (e.g. lnkd.in)
- Avoid long bullet lists — favor flowing sentences

## Post Structure

1. **Hook** — short question framing the problem (identity, API, partner)
2. **Solution** — tech name + version + standard (RFC) + recent feature
3. **POC / achievement** — what was concretely built
4. **Flow** — one-line summary with arrows (login → API → exchange → API)
5. **Link** — "For devs who want to see what it looks like: [URL]"
6. **CTA** — engaging double question (e.g. V1 vs V2, migration)
7. **Hashtags** — 4–6 technical hashtags at the end of the post
8. **Sign-off** — short personal closing line

## Tone

- Professional yet accessible
- Direct phrasing ("Do you use…?", "Are you considering…?")
- No excessive jargon

## Reference Example

```
Votre API doit appeler une API partenaire en conservant l'identité de l'utilisateur connecté ? 

hashtag#Token_Exchange V2 (RFC 8693) + hashtag#Keycloak : la nouvelle implémentation, qui s'appuie sur le hashtag#JWT_Authorization_Grant introduit en Keycloak 26.5. Plus de token forwarding ou de proxies maison.

J'ai mis en place un POC reproductible : hashtag#IdentityBrokering OIDC entre deux realms, Token Exchange avec audiences strictes, propagation correcte du sub. 

Le flux complet : login → API Vita → échange → API Mawa .

Pour les devs qui veulent voir à quoi ça ressemble : [URL]

Vous utilisez Keycloak Token Exchange V1 ? Vous envisagez de passer en V2 / JWT Authorization Grant ?

hashtag#IAM hashtag#OAuth2 hashtag#ZeroTrust hashtag#OpenSource

☀️ Portez-vous bien
```
