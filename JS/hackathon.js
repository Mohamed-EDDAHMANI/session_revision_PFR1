
let candidatures = []
let candidaturesId = 0;



// 2. Fonctions de base (1h)

function ajouterCandidature(nom, age, projet) {
    candidatures.push({
        id: candidaturesId++,
        nom: nom,
        age: age,
        projet: projet,
        statut: "en attente" // ou "validée", "rejetée"
    })
}

function afficherToutesLesCandidatures(candidatures) {
    for (let x = 0; x < candidatures.length; x++) {
        console.log(`
          candidatures ${x + 1} :
    id : ${candidatures[x].id} .
    nom : ${candidatures[x].nom} .
    age : ${candidatures[x].age} .
    projet : ${candidatures[x].projet} .
    statut : ${candidatures[x].statut} .
    `)
    }
}

function validerCandidature(id) {
    for (let x = 0; x < candidatures.length; x++) {
        if (candidatures[x].id == id) {
            candidatures[x].statut = 'validée'
        }
    }
}
function rejeterCandidature(id) {
    for (let x = 0; x < candidatures.length; x++) {
        if (candidatures[x].id == id) {
            candidatures[x].statut = 'rejetée'
        }
    }
}
function rechercherCandidat(nom) {
    let candidat = candidatures.filter(item => {
        item.nom == nom
    })
    return candidat[0];
}

// 3. Fonctions avancées (1h)

function filtrerParStatut(statut) {
    let candidatSorted = candidatures.filter(item => {
        item.statut == statut
    })
    afficherToutesLesCandidatures(candidatSorted)
}


function statistiques() {
    let total = candidatures.length;
    let validees = 0;
    let rejetees = 0;
    let enAttente = 0;

    for (let x = 0; x < candidatures.length; x++) {
        switch (candidatures[x].statut) {
            case 'validée':
                validees++
                break;

            case 'Rejetées':
                rejetees++;
                break;

            case 'en attente':
                enAttente++;
                break;

            default:
                ''
                break;
        }
    }
    console.log('Total des condidat : ' + total);
    console.log('Le nombre des condidat validees : ' + validees);
    console.log('Le nombre des condidat rejetees : ' + rejetees);
    console.log('Le nombre des condidat enAttente : ' + enAttente);
}

function trierParNom() { }


// trierParAge(desc = false)
//  → trie les candidats par âge croissant (ou décroissant si desc = true)

function trierParAge(desc = false) {
    if (desc) {
        for (let index = 0; index < candidatures.length; index++) {
            let tmp;
            for (let indexTwo = 1; indexTwo < candidatures.length; indexTwo++) {
                if (candidatures[index].age > candidatures[indexTwo].age) {
                    tmp = candidatures[indexTwo].age;
                    candidatures[indexTwo].age = candidatures[index].age;
                    candidatures[index].age = tmp;
                }
            }
        }
    }else{
        for (let index = 0; index < candidatures.length; index++) {
            let tmp;
            for (let indexTwo = 1; indexTwo < candidatures.length; indexTwo++) {
                if (candidatures[index].age < candidatures[indexTwo].age) {
                    tmp = candidatures[indexTwo].age;
                    candidatures[indexTwo].age = candidatures[index].age;
                    candidatures[index].age = tmp;
                }
            }
        }
    }
}

function topProjets(motCle){
    let arr = candidatures.filter(item => {
        candidatures.projet
    })
}



ajouterCandidature('hicham', 21, 'email sender')
ajouterCandidature('hamza', 20, 'email sender')
ajouterCandidature('houssem', 27, 'email sender')
ajouterCandidature('abdolah', 25, 'email sender')
ajouterCandidature('said', 22, 'email sender')