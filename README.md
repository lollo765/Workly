<h1 align="center">
	Workly
</h1>

<p align="center">
  <img  src="https://raw.githubusercontent.com/lollo765/communitywork/master/app/assets/images/Workly_Logo.png?token=GHSAT0AAAAAABI3BO2P35VP6XVYGAZWLU3OYVUQV3A" width="200">
</p>

## Scopo del progetto
**Workly** è una web app che intende fornire a lavoratori e datori di lavoro un modo più sicuro, facilmente tracciabile, e senza fee per intereagire tra di loro.
L'applicazione da la possibilita a tutti gli utenti di agire come possibili lavoratori e/o datori offrendo la creazione di annunci di lavoro e gig ( servizi offerti ).
I lavoratori possono candidarsi ed essere assunti in pochi click, dopo di chè le interazioni tra datore e lavoratore verranno
mediate in modo diretto da uno smart contract, garantendo al lavoratore la sicurezza di essere pagato, e al datore la sicurezza di ricevere il lavoro.
Per facilitare lo scheduling dei lavori a cui si è stati assunti gli utenti possono agiungerli al loro Google Calendar tramite un click.
Per facilitare la creazione dei lavori e scegliere come crypto di pagamento la più adatta sono presenti i prezzi delle monete selezionabili.

### Suddivisione Attivita

> Marco 
Stories: 6, 7, 8 , 9, 10, 11, 12, 25, 35, 36, 37, 38

> Linch 
Stories: 13, 14, 15, 16, 17, 18, 19, 27, 28

> Matteo 
Stories: 20, 21, 22, 23, 26, 39, 40, 41, 42, 29

> Roberto
Stories: 1, 2, 3, 4, 5, 24, 30, 31, 32, 33, 34 

### Piano Dei Test
- Test registrazione: Controllo che un utente possa registrasi correttamente al sito
- Test Aggiunta Gig: Controllo possibilita che un utente registrato possa aggiungere una gig
- Test Modifica Gig: Controllo possibilita che un utente registrato possa aggiungere una gig e modificarla

### Struttura Di Controllo
- Utente Non Registrato
    - visionare lista lavori e singolo lavoro
    - visionare lista gig e singola gig
    - visionare lista lavoratori e singolo lavoratore

- Utente Registrato
    - visionare lista lavori e singolo lavoro + creazione/modifica lavoro
    - visionare lista gig e singola gig + creazione/modifica gig
    - visionare lista lavoratori e singolo lavoratore + modifica profilo
    - assunzione/rimozione candidati al suo lavoro
    - candidarsi a un lavoro

- Administrator
    - cancella qualsisasi gig
    - cancella qualsiasi lavoro
    - cancella qualsiasi utente
