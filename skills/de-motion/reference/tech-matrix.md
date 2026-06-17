# Motion-vs-Tech Matrix

For every distinct motion effect identified in the per-section architecture and the Signature moment, assign a technology and state the reason.

```
Effect: [specific description — e.g. "Pinned hero section with depth parallax on scroll"]
Technology: [GSAP ScrollTrigger / Framer Motion / CSS / R3F (Three.js) / CSS + JS minimal / None]
Reason: [why this tool wins for this effect — be specific: "ScrollTrigger because scrub requires frame-accurate progress binding that Framer's viewport trigger can't provide"]
Sub-skills to invoke: [list the skills that implement this effect]
Reduced-motion override: [how this effect is disabled/replaced under prefers-reduced-motion]
Perf note: [any bundle-size, paint, or compositing consideration]
```

Technology selection guide (enforce these defaults unless a specific case overrides):

| Effect type | Default tool | Override condition |
|---|---|---|
| Scroll-driven scrub / pin | GSAP ScrollTrigger | — |
| Timeline sequences with stagger | GSAP timeline + gsap-plugins | — |
| Component-level enter/exit transitions | Framer Motion | Only when already in the React tree for UI state; avoid for scroll-driven work |
| Pure CSS transitions (hover, focus, simple fade) | CSS | Always prefer CSS for stateless, non-scroll effects |
| 3D scenes, WebGL, particles | R3F / Three.js | CSS/SVG if the 3D is decorative and a flat fallback is acceptable |
| Cinematic full-page scroll system | cinematic-gsap-lenis-motion-system | When the whole page uses Lenis smooth scroll |
| Word-by-word text reveal | staggered-word-reveal | — |
| Image/section masked entrance | masked-reveal | — |
| Background blur progression | progressive-blur | — |

## Skills invoked and their role

| Phase | Skill | Purpose |
|---|---|---|
| References | `firecrawl-search` | Pull live Awwwards / motion references before shortlist |
| References | `firecrawl-deep-research` | Supplement with deeper scroll-experience research |
| Full-page scroll system | `cinematic-gsap-lenis-motion-system` | When the page uses Lenis smooth scroll as the base |
| Scroll-driven effects | `gsap-scrolltrigger` | Pin, scrub, parallax, viewport-triggered sequences |
| Timeline sequences | `gsap-timeline` | Staggered timelines, orchestrated multi-element sequences |
| Advanced GSAP effects | `gsap-plugins` | SplitText, DrawSVG, MorphSVG, or other plugin-dependent effects |
| 3D scenes | `threejs` | Full Three.js scene integration for 3D signature moments |
| 3D objects | `webgl-3d-object` | Single 3D object in a canvas layer |
| Globe / particle 3D | `globe-gl` | Interactive globe-style 3D effects |
| Globe particles | `globe-particles` | Particle-based globe or sphere effects |
| Text reveal | `staggered-word-reveal` | Word-by-word or character-by-character text entrance |
| Image entrance | `masked-reveal` | Clip-path or mask-based image/section reveal |
| Background blur | `progressive-blur` | Scroll-driven blur progression on backgrounds |
