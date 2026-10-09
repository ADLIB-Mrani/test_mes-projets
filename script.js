const totalHours = 30;

const projects = [
  {
    title: "Découverte de l'environnement de travail",
    period: "TD1 · S41",
    hours: 2,
    competency: "C3"
  },
  {
    title: "Architecture générale",
    period: "TD2 · S43",
    hours: 2,
    competency: "C4"
  },
  {
    title: "Partie serveur (BDD + contrôleur)",
    period: "TD3 · S48",
    hours: 4,
    competency: "C1"
  },
  {
    title: "Visualisation + intégration projet",
    period: "TD4 et projet · S48 à S6",
    hours: 14,
    competency: "C2/C3/C4"
  }
];

const competenceHours = {
  C1: 9,
  C2: 6,
  C3: 7,
  C4: 8
};

const globalStats = [
  ["Heures de formation", `${totalHours} h`],
  ["Projets réalisés", String(projects.length)],
  ["Compétences BUT", "4"],
  ["Compétences techniques", "6+"]
];

const createTile = (title, value, subtitle = "") => {
  const tile = document.createElement("article");
  tile.className = "tile";
  tile.innerHTML = `<h4>${title}</h4><p><strong>${value}</strong></p>${
    subtitle ? `<p class="muted">${subtitle}</p>` : ""
  }`;
  return tile;
};

globalStats.forEach(([title, value]) => {
  document.getElementById("global-stats").appendChild(createTile(title, value));
});

Object.entries(competenceHours).forEach(([competence, hours]) => {
  document
    .getElementById("competence-hours")
    .appendChild(createTile(competence, `${hours} h`, `${Math.round((hours / totalHours) * 100)}% du total`));
});

projects.forEach((project) => {
  document
    .getElementById("project-list")
    .appendChild(createTile(project.title, `${project.hours} h`, `${project.period} · ${project.competency}`));
});
