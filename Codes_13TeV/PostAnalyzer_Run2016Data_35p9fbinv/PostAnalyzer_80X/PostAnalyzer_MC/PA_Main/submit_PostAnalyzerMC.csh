#!/bin/tcsh

setenv eosDir /eos/uscms/store/user/rocky86
setenv lpcqstarDir /eos/uscms/store/user/lpcqstar
setenv leptonjetsDir /eos/uscms/store/user/leptonjets

#Signal and Backgrounds Path
setenv MCnTuplesDir root://cmseos.fnal.gov//eos/uscms/store/user/lpcqstar/13TeV/Ntuples/80X/MC/Summer16TrancheIV/
setenv qstar Qstar
setenv bstar Bstar
setenv GJets GJ_madgraph
setenv DiJet Dijet
setenv ewk EWK
setenv GJets_dr0p4 GJ_DR0p4_madgraph

#0 = Qstar_f1p0  | #1 Qstar_f0p5 | #2 = Qstar_f0p1 |
#3 = Bstar_f1p0  | #4 Bstar_f0p5 | #5 = Bstar_f0p1 |
#6 = GJ_Madgraph | #7 = QCD      | #8 = EWK        | 
#9 = GJ_Madgraph_dR0p4
#foreach case (0 1 2 3 4 5 6 7 8 )
foreach case ( 3  6  7  8  )  #0  3  6  7 )
set sampleIndex = 0 ##all variables on which some arithematical operation has to be performed, should be defined by set and not setenv.

##Toggle switches for all signal and bkgs
setenv GJ 0
setenv QCD 0
setenv EWK 0
setenv Bstar 0
setenv Qstar 0

if ( ${case} == 0 ) then
setenv Qstar 1
echo "*********Running for Qstar_f-1p0*********"
foreach i (QstarToGJ_M500_f1p0  QstarToGJ_M1000_f1p0  QstarToGJ_M2000_f1p0  QstarToGJ_M3000_f1p0  QstarToGJ_M4000_f1p0  QstarToGJ_M5000_f1p0  QstarToGJ_M6000_f1p0  QstarToGJ_M7000_f1p0  QstarToGJ_M8000_f1p0  QstarToGJ_M9000_f1p0)
set XS = (3.033E2  1.632E1  5.213E-1  4.272E-2  4.8E-3  5.835E-4  7.076E-5  8.66E-6  1.283E-6  2.985E-7) # in pb
set totalEvents = ()

setenv sourceDir ${MCnTuplesDir}/${qstar}/${i}/
endif

if ( ${case} == 1 ) then
setenv Qstar 1
echo "*********Running for Qstar_f0p5*********"
foreach i (QstarToGJ_M500_f0p5  QstarToGJ_M1000_f0p5  QstarToGJ_M2000_f0p5  QstarToGJ_M3000_f0p5  QstarToGJ_M4000_f0p5  QstarToGJ_M5000_f0p5  QstarToGJ_M6000_f0p5  QstarToGJ_M7000_f0p5  QstarToGJ_M8000_f0p5  QstarToGJ_M9000_f0p5)
set XS = (7.378E1  4.129E0  1.328E-1  1.095E-2  1.212E-3  1.437E-4  1.62E-5  1.672E-6  1.647E-7  2.329E-8) # in pb
set totalEvents = ()

setenv sourceDir ${MCnTuplesDir}/${qstar}/${i}/
endif

if ( ${case} == 2 ) then
setenv Qstar 1
echo "*********Running for Qstar_f0p1*********"
foreach i (QstarToGJ_M500_f0p1  QstarToGJ_M1000_f0p1  QstarToGJ_M2000_f0p1  QstarToGJ_M3000_f0p1  QstarToGJ_M4000_f0p1  QstarToGJ_M5000_f0p1  QstarToGJ_M6000_f0p1  QstarToGJ_M7000_f0p1  QstarToGJ_M8000_f0p1  QstarToGJ_M9000_f0p1)
set XS = (2.955E0  1.655E-1  5.315E-3  4.356E-4  4.861E-5  5.715E-6  6.241E-7  5.973E-8  4.515E-9  2.655E-10) # in pb
set totalEvents = ()

setenv sourceDir ${MCnTuplesDir}/${qstar}/${i}/
endif

if ( ${case} == 3 ) then
setenv Bstar 1
echo "*********Running for Bstar_f1p0*********"
foreach i (BstarToGJ_M500_f1p0  BstarToGJ_M1000_f1p0  BstarToGJ_M1500_f1p0  BstarToGJ_M2000_f1p0  BstarToGJ_M2500_f1p0  BstarToGJ_M3000_f1p0  BstarToGJ_M3500_f1p0  BstarToGJ_M4000_f1p0  BstarToGJ_M4500_f1p0  BstarToGJ_M5000_f1p0)
set XS = (6.236  2.148E-1  2.204E-2  3.585E-3  7.488E-4  1.766E-4  4.517E-5  1.202E-5  3.289E-6  9.216e-7) # in pb
set totalEvents = ()

setenv sourceDir ${MCnTuplesDir}/${bstar}/${i}/
endif

if ( ${case} == 4 ) then
setenv Bstar 1
echo "*********Running for Bstar_f0p5*********"
foreach i (BstarToGJ_M500_f0p5  BstarToGJ_M1000_f0p5  BstarToGJ_M1500_f0p5  BstarToGJ_M2000_f0p5  BstarToGJ_M2500_f0p5  BstarToGJ_M3000_f0p5  BstarToGJ_M3500_f0p5  BstarToGJ_M4000_f0p5  BstarToGJ_M4500_f0p5  BstarToGJ_M5000_f0p5)
set XS = (1.574  5.438E-2  5.666E-3  9.162E-4  1.884E-4  4.393E-5  1.112E-5  2.909E-6  7.705E-7  2.027E-7) # in pb
set totalEvents = ()

setenv sourceDir ${MCnTuplesDir}/${bstar}/${i}/
endif

if ( ${case} == 5 ) then
setenv Bstar 1
echo "*********Running for Bstar_f0p1*********"
foreach i (BstarToGJ_M500_f0p1  BstarToGJ_M1000_f0p1  BstarToGJ_M1500_f0p1  BstarToGJ_M2000_f0p1  BstarToGJ_M2500_f0p1  BstarToGJ_M3000_f0p1  BstarToGJ_M3500_f0p1  BstarToGJ_M4000_f0p1  BstarToGJ_M4500_f0p1  BstarToGJ_M5000_f0p1)
set XS = (6.357E-2  2.175E-3  2.278E-4  3.674E-5  7.595E-6  1.768E-6  4.454E-7  1.155E-7  3.031E-8  7.703E-9) # in pb
set totalEvents = ()

setenv sourceDir ${MCnTuplesDir}/${bstar}/${i}/
endif

if ( ${case} == 6 ) then
setenv GJ 1
echo "*********Running for GJet_Madgraph Bkg*********"
foreach i (GJets_HT40To100  GJets_HT100To200  GJets_HT200To400  GJets_HT400To600  GJets_HT600ToInf) # in pb
set XS = (20820.0  9201.0  2308.0  275.2  93.31)
set totalEvents = ()

setenv sourceDir ${MCnTuplesDir}/${GJets}/${i}/
endif

if ( ${case} == 7 ) then
setenv QCD 1
echo "*********Running for QCD DiJet Bkg*********"
foreach i (QCD_Pt120to170  QCD_Pt170to300  QCD_Pt300to470   QCD_Pt470to600  QCD_Pt600to800  QCD_Pt800to1000  QCD_Pt1000to1400  QCD_Pt1400to1800  QCD_Pt1800to2400  QCD_Pt2400to3200  QCD_Pt3200toInf)
set XS = (471100.0  117276.0  7823.0  648.2  186.9  32.293  9.4183  0.84265  0.114943  0.00682981  0.000165445) # in pb
set totalEvents = ()

setenv sourceDir ${MCnTuplesDir}/${DiJet}/${i}/
endif

if ( ${case} == 8 ) then
setenv EWK 1
echo "*********Running for ElectroWeak Bkg*********"
foreach i (DYJetsToLL_Pt100To250  DYJetsToLL_Pt250To400  DYJetsToLL_Pt400To650  DYJetsToLL_Pt650ToInf  WJetsToLNu )
set XS = (83.12  3.047  0.3921  0.03636  61526.7) # in pb
#foreach i ( WJetsToLNu )
#set XS = (61526.7) # in pb
set totalEvents = ()

setenv sourceDir ${MCnTuplesDir}/${ewk}/${i}/
endif

if ( ${case} == 9 ) then
setenv GJ 1
echo "*********Running for GJet_Madgraph dr0p4 Bkg*********"
foreach i (GJets_DR0p4_HT40To100  GJets_DR0p4_HT100To200  GJets_DR0p4_HT200To400  GJets_DR0p4_HT400To600  GJets_DR0p4_HT600ToInf)
set XS = (22760.0  4703.0  836.4  83.51  24.21) # in pb
set totalEvents = ()

setenv sourceDir ${MCnTuplesDir}/${GJets_dr0p4}/${i}/
endif

if ( -f PostAnalyzer_MC.C ) then
echo "++++++++++++++ Deleting PostAnalyzer_MC.C ++++++++++++++"
rm PostAnalyzer_MC.C
endif

if ( -f PostAnalyzer_MC.h ) then
echo "++++++++++++++ Deleting PostAnalyzer_MC.h ++++++++++++++"
rm PostAnalyzer_MC.h
endif

@ sampleIndex = ${sampleIndex} + 1

setenv filenameTag ${i}
setenv destinationDir ${sourceDir}

echo "Filename = ${filenameTag}"
echo "Source Dir = ${sourceDir}"

cat >> PostAnalyzer_MC.C <<EOF 
#define PostAnalyzer_MC_cxx
#include "PostAnalyzer_MC.h"
#include <TH2.h>
#include <TStyle.h>
#include <TCanvas.h>

void PostAnalyzer_MC::Loop()
{
//   In a ROOT session, you can do:
//      root> .L PostAnalyzer_MC.C
//      root> PostAnalyzer_MC t
//      root> t.GetEntry(12); // Fill t data members with entry number 12
//      root> t.Show();       // Show values of entry 12
//      root> t.Show(16);     // Read and show values of entry 16
//      root> t.Loop();       // Loop on all entries
//

//     This is the loop skeleton where:
//    jentry is the global entry number in the chain
//    ientry is the entry number in the current Tree
//  Note that the argument to GetEntry must be:
//    jentry for TChain::GetEntry
//    ientry for TTree::GetEntry and TBranch::GetEntry
//
//       To read only selected branches, Insert statements like:
// METHOD1:
//    fChain->SetBranchStatus("*",0);  // disable all branches
//    fChain->SetBranchStatus("branchname",1);  // activate branchname
// METHOD2: replace line
//    fChain->GetEntry(jentry);       //read all branches
//by  b_branchname->GetEntry(ientry); //read only this branch
   if (fChain == 0) return;

   //Initializing various parameters here
   //Luminosity of Data Compared
   Lumi = 35866.0; //(pb^{-1}) //Re-miniAOD//  (36813.0 pb-1)Rereco-BCDEFG_PromptReco-H  (24487 pb-1)Run2016BCDEFG_PromptReco

   Cut_Vtx_z = 24.0;
   Cut_Vtx_ndof = 4.0;
   Cut_Vtx_rho = 2.0;

   Cut_Photon_pt = 200.0; // GeV                                                                                                             
   Cut_Photon_eta = 1.4442;

   Cut_Jet_pt = 170.0; // GeV
   Cut_Jet_eta = 2.4;

   Cut_GJdPhi = 1.5;
   Cut_GJdEta = 1.5;
   
   Cut_GJInvtMass = 700.0;
   
   Cut_PhId = "medium";
   Cut_JetId = "tight";

   //Uncomment this in script
   //Define Output file here
   //   TString OutputPath = "${destinationDir}/";
   TString OutputFile = "${filenameTag}";
   //  // file = new TFile(OutputPath+OutputFile+".root", "RECREATE");
   file = new TFile(OutputFile+".root", "RECREATE");

   //Define Histograms here
   BookHistograms();

   //Running function for Pile up reweighting
   PileupReWeighting();

   //Defining CSVc2 bTag Operating Point (LOOSE, MEDIUM, TIGHT OR RESHAPING (for boosted btag discs))
   BTagEntry::OperatingPoint CSV_OP = BTagEntry::OP_LOOSE; // required for SF calculation
   std::string CSV_WP = "L"; // required for Tagger (L,M or T)

   //Event For loop starts from here
   Long64_t nentries = fChain->GetEntries();
   cout << "<Total entries: " << nentries << endl; 
   Long64_t nbytes = 0, nb = 0;
   /*
   //running for loop to get the total genweight
   Long64_t nb1 = 0;
   Float_t Tot_genWt = 0;
   for (Long64_t bentry=0; bentry<nentries;bentry++) {
     Long64_t kentry = LoadTree(bentry);
     nb1 = fChain->GetEntry(bentry);
     cout << "genWt = " << genWeight << endl;
     Tot_genWt += genWeight;
   }
   cout << "Tot genWt = " << Tot_genWt << endl;
   //---------------------------------------------
   */

   //Switches for overlap removal
   Double_t dR_overlap = 0.05;
   Bool_t Remove_QCD = false;
   Bool_t Remove_GJ = false;
   //uncomment in script
   if(${QCD}) Remove_QCD = true;
   if(${GJ}) Remove_GJ = true;

   for (Long64_t jentry=0; jentry<nentries;jentry++) {
     //cout << "<Analyzing entry: " << jentry << endl;
      Long64_t ientry = LoadTree(jentry);
      if (ientry < 0) break;
      nb = fChain->GetEntry(jentry);   nbytes += nb;

      //Uncomment this in script  
      Lumi_EvtWt = (Lumi*(${XS[${sampleIndex}]}))/nentries;

      PU_EvtWt = PUWeights((*puTrue)[0]); //Since TrueNumofInt is same for an event, so any value of the vector puTrue can be taken. 
                                          //(see definition here: https://twiki.cern.ch/twiki/bin/viewauth/CMS/Pileup_MC_Information)
      PreBTag_EvtWt = Lumi_EvtWt * PU_EvtWt;
      
      PC = -1;
      JC = -1;
      GoodVertex = 0;    

      //Initially making all bools to false
      Pass_HLT = false;
      HasPrimaryVtx = false;
      Pass_PhoPt = false;
      Pass_PhoEtaEB = false;
      Pass_JetPt = false;
      Pass_JetEta = false;
      //No dphi cut
      Pass_GJdPhi = true;
      Pass_GJdEta = false;
      Pass_CSVv2bTag = false;
      Pass_GJInvtMass = false;
      
      //Running different functions     
      Pass_HLT = true; //Always true for MC
      GoodVertex = nGoodVtx;
      if(GoodVertex > 0) HasPrimaryVtx = true;

      GoodIsoPhotons.clear();
      GoodIsoPhotons = GoodPhotons(Cut_PhId);  //All photons passing loose id, residual spikes and pt > 30.0

      GoodIsoBarrelPhotons.clear();
      if(GoodIsoPhotons.size() != 0){
	for(Int_t ip = 0; ip <  GoodIsoPhotons.size(); ip++){
	  if( (*phoEt)[GoodIsoPhotons[ip]] > Cut_Photon_pt && fabs((*phoSCEta)[GoodIsoPhotons[ip]]) < Cut_Photon_eta){
	  GoodIsoBarrelPhotons.push_back(GoodIsoPhotons[ip]);
	  }
	}
      }

      if(GoodIsoBarrelPhotons.size() != 0) PC = GoodIsoBarrelPhotons[0];

      GoodIsoJets.clear();
      GoodIsoJets = GoodJets(Cut_JetId); // All jets passing dR > 0.5, tight jet id and pt > 30.0
      if(GoodIsoJets.size() != 0) JC = GoodIsoJets[0];

      if(JC > -1) Pass_JetPt = ((*jetPt)[JC] > Cut_Jet_pt);
      if(JC > -1) Pass_JetEta = (fabs((*jetEta)[JC]) < Cut_Jet_eta);
      //      if(PC > -1 && JC > -1) Pass_GJdPhi =  ((GetdPhi((*phoSCPhi)[PC], (*jetPhi)[JC])) > Cut_GJdPhi);
      if(PC > -1 && JC > -1) Pass_GJdEta = ((GetdEta((*phoSCEta)[PC], (*jetEta)[JC])) < Cut_GJdEta);
      if(PC > -1 && JC > -1) Pass_GJInvtMass = ((GetInvtMass(PC, JC)) > Cut_GJInvtMass);             
      if(JC > -1) Pass_CSVv2bTag = CSVv2bTag(JC, CSV_WP);

      h_CutFlow_qstar->Fill(0.5);
      h_CutFlow_bstar->Fill(0.5);
      h_CutFlowWt_qstar->Fill(0.5, PreBTag_EvtWt);
      h_CutFlowWt_bstar->Fill(0.5, PreBTag_EvtWt);
      h_CutFlowTotalWt_bstar->Fill(0.5, PreBTag_EvtWt);

      //Primary vertex info for noCut only
      h_trueNumofInt       ->Fill((*puTrue)[0]);
      h_goodPV_noWt        ->Fill(GoodVertex);
      h_goodPV_LumiWt      ->Fill(GoodVertex, Lumi_EvtWt);
      h_goodPV_PUWt        ->Fill(GoodVertex, PU_EvtWt);

      //------------------------------------------------------------
      //Photon distributions noCut
      if(nPho > 0 && nJet > 0){
	h_PhotonPt[0]               ->Fill((*phoEt)[0], PreBTag_EvtWt);
	h_PhotonCalibPt[0]          ->Fill((*phoCalibEt)[0], PreBTag_EvtWt);
	h_PhotonEta[0]              ->Fill((*phoSCEta)[0], PreBTag_EvtWt);
	h_PhotonPhi[0]              ->Fill((*phoSCPhi)[0], PreBTag_EvtWt);
	h_Photon_SigmaIEtaIEta[0]   ->Fill((*phoSigmaIEtaIEtaFull5x5)[0], PreBTag_EvtWt);
	h_Photon_R9[0]              ->Fill((*phoR9)[0], PreBTag_EvtWt);
	h_Photon_HoverE[0]          ->Fill((*phoHoverE)[0], PreBTag_EvtWt);
	h_Photon_EleVeto[0]         ->Fill((*phoEleVeto)[0], PreBTag_EvtWt);
	h_Photon_CorrPFChIso[0]     ->Fill(TMath::Max(((*phoPFChIso)[0] - rho*EAChargedHadrons((*phoSCEta)[0])), 0.0), PreBTag_EvtWt);
	h_Photon_CorrPFNeuIso[0]    ->Fill(TMath::Max(((*phoPFNeuIso)[0] - rho*EANeutralHadrons((*phoSCEta)[0])), 0.0), PreBTag_EvtWt);
	h_Photon_CorrPFPhoIso[0]    ->Fill(TMath::Max(((*phoPFPhoIso)[0] - rho*EAPhotons((*phoSCEta)[0])), 0.0), PreBTag_EvtWt);
     
	//Jet distributions noCut (Hists named h_bJet to define Jet and bJet dist in one go in BookHistograms() function)
	h_bJetPt[0]                 ->Fill((*jetPt)[0], PreBTag_EvtWt);
	h_bJetEta[0]                ->Fill((*jetEta)[0], PreBTag_EvtWt);
	h_bJetPhi[0]                ->Fill((*jetPhi)[0], PreBTag_EvtWt);
	h_bJet_Mt[0]                ->Fill((*jetMt)[0], PreBTag_EvtWt);
	h_bJet_area[0]              ->Fill((*jetArea)[0], PreBTag_EvtWt);
	h_bJet_Mass[0]              ->Fill((*jetMass)[0], PreBTag_EvtWt);
	h_bJet_NHEF[0]              ->Fill((*jetNHF)[0], PreBTag_EvtWt);
	h_bJet_NEEF[0]              ->Fill((*jetNEF)[0], PreBTag_EvtWt);
        h_bJet_NConst[0]            ->Fill((*jetNConstituents)[0], PreBTag_EvtWt);
	h_bJet_CHEF[0]              ->Fill((*jetCHF)[0], PreBTag_EvtWt);
	h_bJet_ChMult[0]            ->Fill((*jetNCH)[0], PreBTag_EvtWt);
	h_bJet_CEEF[0]              ->Fill((*jetCEF)[0], PreBTag_EvtWt);
	h_bJet_MUF[0]               ->Fill((*jetMUF)[0], PreBTag_EvtWt);
	h_bJet_NNP[0]               ->Fill((*jetNNP)[0], PreBTag_EvtWt);
		      
	//Photon+Jet distributions noCut
	h_GbJetInvtMass_VarBin[0]   ->Fill(GetInvtMass(0, 0), PreBTag_EvtWt);
	h_GbJetInvtMass_UnitBin[0]  ->Fill(GetInvtMass(0, 0), PreBTag_EvtWt);
	h_GbJet_dEta[0]             ->Fill(GetdEta((*phoSCEta)[0], (*jetEta)[0]), PreBTag_EvtWt);
	h_GbJet_dPhi[0]             ->Fill(GetdPhi((*phoSCPhi)[0], (*jetPhi)[0]), PreBTag_EvtWt);
	h_GbJet_dR[0]               ->Fill(GetdR((*phoSCEta)[0], (*jetEta)[0], (*phoSCPhi)[0], (*jetPhi)[0]), PreBTag_EvtWt);
	h_cosThetaStar[0]           ->Fill(GetCosThetaStar((*phoSCEta)[0], (*jetEta)[0]), PreBTag_EvtWt);
		      
	//PFMet distributions for noCut
	h_PFMet[0]                  ->Fill(pfMET, PreBTag_EvtWt);
	h_SumPFMet[0]               ->Fill(pfMETsumEt, PreBTag_EvtWt);
	h_MetBySumMET[0]            ->Fill(pfMET/pfMETsumEt, PreBTag_EvtWt);
	h_PFMetVsGJmass[0]          ->Fill(GetInvtMass(0, 0), pfMET, PreBTag_EvtWt);
	h_PFMetOverSumEtVsGJmass[0] ->Fill(GetInvtMass(0, 0), pfMET/pfMETsumEt, PreBTag_EvtWt);
	h_MetByPhPt[0]              ->Fill(pfMET/(*phoEt)[0], PreBTag_EvtWt);    

	//Photon vs Jet dist for noCut
	h_PhPt_vs_bJetPt[0]         ->Fill((*phoEt)[0], (*jetPt)[0], PreBTag_EvtWt);
	h_PhEta_vs_bJetEta[0]       ->Fill((*phoSCEta)[0], (*jetEta)[0], PreBTag_EvtWt);
		      
	//CSVv2 discriminator distributions for noCut
	h_CSVv2Dist[0]              ->Fill((*jetCSV2BJetTags)[0], PreBTag_EvtWt);
	h_CSVv2_vs_bJetPt[0]        ->Fill((*jetPt)[0], (*jetCSV2BJetTags)[0], PreBTag_EvtWt);
	h_CSVv2_vs_bJetEta[0]       ->Fill((*jetEta)[0], (*jetCSV2BJetTags)[0], PreBTag_EvtWt);

	//Primary vertex and number of photon and jets for noCut
	h_goodPV_TotalWt[0]              ->Fill(GoodVertex, PreBTag_EvtWt);
	h_nIsoPhotons[0]                 ->Fill(GoodIsoPhotons.size(), PreBTag_EvtWt);  // Tot # of isolated photons
	h_nGoodPhotons[0]                ->Fill(GoodIsoBarrelPhotons.size(), PreBTag_EvtWt); // Tot # of isolated photons with pt > cut and eta < cut 
	for(int ip = 0; ip < GoodIsoPhotons.size(); ip++){
	  h_IsoPhotonIdxVsPt[0]          ->Fill((*phoEt)[GoodIsoPhotons[ip]], ip+1, PreBTag_EvtWt);
	}
	for(int ii = 0; ii < GoodIsoBarrelPhotons.size(); ii++){
	  h_GoodPhotonIdxVsPt[0]         ->Fill((*phoEt)[GoodIsoBarrelPhotons[ii]], ii+1, PreBTag_EvtWt);
	}				    
	h_nJets[0]                       ->Fill(GoodIsoJets.size(), PreBTag_EvtWt);
	for(int ij = 0; ij < GoodIsoJets.size(); ij++){
	  h_JetIdxVsPt[0]                ->Fill((*jetPt)[GoodIsoJets[ij]], ij+1, PreBTag_EvtWt);
	}
      }
      //------------------------------------------------------------
      //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      //                     QSTAR
      //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      if(Pass_HLT){
	h_CutFlow_qstar->Fill(1.5);
	h_CutFlowWt_qstar->Fill(1.5, PreBTag_EvtWt);
         
	if(HasPrimaryVtx){
	  h_CutFlow_qstar->Fill(2.5);
	  h_CutFlowWt_qstar->Fill(2.5, PreBTag_EvtWt);

	  if(GoodIsoPhotons.size() > 0){
	    h_CutFlow_qstar->Fill(3.5);
	    h_CutFlowWt_qstar->Fill(3.5, PreBTag_EvtWt);

	    if(PC > -1){
	      h_CutFlow_qstar->Fill(4.5);
	      h_CutFlowWt_qstar->Fill(4.5, PreBTag_EvtWt);

	      //---------------------------------------------------------------------
	      //Overlap removal and gen distributions
	      //QCD/GJ overlap removal (overlap is removed here only as the events is already lost from the loop, so not available at b* level)
	      Int_t PC_match = MatchedPromptGenPhotonToReco(PC); //Matched prompt gen photon with dR < 0.1 and dpt/pt < 0.1   
	      Bool_t rm_QCD = false;
	      Bool_t rm_GJ = false;
	      double minDR = 10.0;

	      if(PC_match > -1){ //true matched photons including overlaps

		for(Int_t ii = 0; ii < nMC; ii++){
		  if(ii == PC_match) continue;
		  if((*mcStatus)[ii] != 22 && (*mcStatus)[ii] != 23) continue;
		  if(fabs((*mcPID)[ii]) > 21) continue;

		  double dR_temp = GetdR((*mcEta)[PC_match], (*mcEta)[ii], (*mcPhi)[PC_match], (*mcPhi)[ii]);
		  if(dR_temp < minDR) minDR = dR_temp;
		}
		if(minDR > dR_overlap)  rm_QCD = true;
		if(minDR < dR_overlap)  rm_GJ = true;
	      }

	      h_matchedPromptGenPhoton_GenParton_dR[0]->Fill(minDR, PreBTag_EvtWt);
	      h_matchedPromptGenPhoton_GenParton_dPToverPT[0]->Fill(fabs((*phoEt)[PC] - (*mcPt)[PC_match])/(*phoEt)[PC], PreBTag_EvtWt);
	 
	      if(Remove_QCD && rm_QCD) continue; //Removing QCD event
	      if(Remove_GJ && rm_GJ) continue; //Removing GJ event

	      h_matchedPromptGenPhoton_GenParton_dR[1]->Fill(minDR, PreBTag_EvtWt);
	      h_matchedPromptGenPhoton_GenParton_dPToverPT[1]->Fill(fabs((*phoEt)[PC] - (*mcPt)[PC_match])/(*phoEt)[PC], PreBTag_EvtWt);

	      //dR dists for non prompts
	      Int_t PC_GJmatch = MatchedNonPromptGenPhotonToReco(PC); //Matched non-prompt gen photon with dR < 0.1 and dpt/pt < 0.1
	      double minGJDR = 10.0;

	      if(PC_GJmatch > -1){

		for(Int_t ii = 0; ii < nMC; ii++){
		  if(ii == PC_GJmatch) continue;
		  if((*mcStatus)[ii] != 22 && (*mcStatus)[ii] != 23) continue;
		  if(fabs((*mcPID)[ii]) > 21) continue;

		  double dR_GJtemp = GetdR((*mcEta)[PC_GJmatch], (*mcEta)[ii], (*mcPhi)[PC_GJmatch], (*mcPhi)[ii]);
		  if(dR_GJtemp < minGJDR) minGJDR = dR_GJtemp;
		}
	      }

	      h_matchedNonPromptGenPhoton_GenParton_dR[0]->Fill(minGJDR, PreBTag_EvtWt);
	      h_matchedNonPromptGenPhoton_GenParton_dPToverPT[0]->Fill(fabs((*phoEt)[PC] - (*mcPt)[PC_GJmatch])/(*phoEt)[PC], PreBTag_EvtWt);

	      h_matchedNonPromptGenPhoton_GenParton_dR[1]->Fill(minGJDR, PreBTag_EvtWt);
	      h_matchedNonPromptGenPhoton_GenParton_dPToverPT[1]->Fill(fabs((*phoEt)[PC] - (*mcPt)[PC_GJmatch])/(*phoEt)[PC], PreBTag_EvtWt);
	      //---------------------------------------------------------------------

	      h_CutFlow_qstar->Fill(5.5);
	      h_CutFlowWt_qstar->Fill(5.5, PreBTag_EvtWt);

	      if(JC > -1){
		h_CutFlow_qstar->Fill(6.5);
		h_CutFlowWt_qstar->Fill(6.5, PreBTag_EvtWt);

		if(Pass_JetPt){
		  h_CutFlow_qstar->Fill(7.5);
		  h_CutFlowWt_qstar->Fill(7.5, PreBTag_EvtWt);

		  if(Pass_JetEta){
		    h_CutFlow_qstar->Fill(8.5);
		    h_CutFlowWt_qstar->Fill(8.5, PreBTag_EvtWt);

 		    if(Pass_GJdPhi){
		      h_CutFlow_qstar->Fill(9.5);
		      h_CutFlowWt_qstar->Fill(9.5, PreBTag_EvtWt);

		      if(Pass_GJdEta){
			h_CutFlow_qstar->Fill(10.5);
			h_CutFlowWt_qstar->Fill(10.5, PreBTag_EvtWt);

			h_matchedPromptGenPhoton_GenParton_dR[2]->Fill(minDR, PreBTag_EvtWt);
			h_matchedPromptGenPhoton_GenParton_dPToverPT[2]->Fill(fabs((*phoEt)[PC] - (*mcPt)[PC_match])/(*phoEt)[PC], PreBTag_EvtWt);
			h_matchedNonPromptGenPhoton_GenParton_dR[2]->Fill(minGJDR, PreBTag_EvtWt);
			h_matchedNonPromptGenPhoton_GenParton_dPToverPT[2]->Fill(fabs((*phoEt)[PC] - (*mcPt)[PC_GJmatch])/(*phoEt)[PC], PreBTag_EvtWt);

			//Evt Wts
			h_PU_EvtWt->Fill(PU_EvtWt);
			h_PreBTag_EvtWt->Fill(PreBTag_EvtWt);

			//----------------------------------------------------------
			//[1]
			//Photon distributions noBTag_noMasscut
			h_PhotonPt[1]               ->Fill((*phoEt)[PC], PreBTag_EvtWt);
			h_PhotonCalibPt[1]          ->Fill((*phoCalibEt)[PC], PreBTag_EvtWt);
			h_PhotonEta[1]              ->Fill((*phoSCEta)[PC], PreBTag_EvtWt);
			h_PhotonPhi[1]              ->Fill((*phoSCPhi)[PC], PreBTag_EvtWt);
			h_Photon_SigmaIEtaIEta[1]   ->Fill((*phoSigmaIEtaIEtaFull5x5)[PC], PreBTag_EvtWt);
			h_Photon_R9[1]              ->Fill((*phoR9)[PC], PreBTag_EvtWt);
			h_Photon_HoverE[1]          ->Fill((*phoHoverE)[PC], PreBTag_EvtWt);
			h_Photon_EleVeto[1]         ->Fill((*phoEleVeto)[PC], PreBTag_EvtWt);
			h_Photon_CorrPFChIso[1]     ->Fill(TMath::Max(((*phoPFChIso)[PC] - rho*EAChargedHadrons((*phoSCEta)[PC])), 0.0), PreBTag_EvtWt);
			h_Photon_CorrPFNeuIso[1]    ->Fill(TMath::Max(((*phoPFNeuIso)[PC] - rho*EANeutralHadrons((*phoSCEta)[PC])), 0.0), PreBTag_EvtWt);
			h_Photon_CorrPFPhoIso[1]    ->Fill(TMath::Max(((*phoPFPhoIso)[PC] - rho*EAPhotons((*phoSCEta)[PC])), 0.0), PreBTag_EvtWt);
		      
			//Jet distributions noBTag_noMasscut 
			h_bJetPt[1]                 ->Fill((*jetPt)[JC], PreBTag_EvtWt);
			h_bJetEta[1]                ->Fill((*jetEta)[JC], PreBTag_EvtWt);
			h_bJetPhi[1]                ->Fill((*jetPhi)[JC], PreBTag_EvtWt);
			h_bJet_Mt[1]                ->Fill((*jetMt)[JC], PreBTag_EvtWt);
			h_bJet_area[1]              ->Fill((*jetArea)[JC], PreBTag_EvtWt);
			h_bJet_Mass[1]              ->Fill((*jetMass)[JC], PreBTag_EvtWt);
			h_bJet_NHEF[1]              ->Fill((*jetNHF)[JC], PreBTag_EvtWt);
			h_bJet_NEEF[1]              ->Fill((*jetNEF)[JC], PreBTag_EvtWt);
			h_bJet_NConst[1]            ->Fill((*jetNConstituents)[JC], PreBTag_EvtWt);
			h_bJet_CHEF[1]              ->Fill((*jetCHF)[JC], PreBTag_EvtWt);
			h_bJet_ChMult[1]            ->Fill((*jetNCH)[JC], PreBTag_EvtWt);
			h_bJet_CEEF[1]              ->Fill((*jetCEF)[JC], PreBTag_EvtWt);
			h_bJet_MUF[1]               ->Fill((*jetMUF)[JC], PreBTag_EvtWt);
			h_bJet_NNP[1]               ->Fill((*jetNNP)[JC], PreBTag_EvtWt);
		      
			//Photon+Jet distributions noBTag_noMasscut 
			h_GbJetInvtMass_VarBin[1]   ->Fill(GetInvtMass(PC, JC), PreBTag_EvtWt);
			h_GbJetInvtMass_UnitBin[1]  ->Fill(GetInvtMass(PC, JC), PreBTag_EvtWt);
			h_GbJet_dEta[1]             ->Fill(GetdEta((*phoSCEta)[PC], (*jetEta)[JC]), PreBTag_EvtWt);
			h_GbJet_dPhi[1]             ->Fill(GetdPhi((*phoSCPhi)[PC], (*jetPhi)[JC]), PreBTag_EvtWt);
			h_GbJet_dR[1]               ->Fill(GetdR((*phoSCEta)[PC], (*jetEta)[JC], (*phoSCPhi)[PC], (*jetPhi)[JC]), PreBTag_EvtWt);
			h_cosThetaStar[1]           ->Fill(GetCosThetaStar((*phoSCEta)[PC], (*jetEta)[JC]), PreBTag_EvtWt);
		      
			//PFMet distributions for noBTag_noMasscut 
			h_PFMet[1]                  ->Fill(pfMET, PreBTag_EvtWt);
			h_SumPFMet[1]               ->Fill(pfMETsumEt, PreBTag_EvtWt);
			h_MetBySumMET[1]            ->Fill(pfMET/pfMETsumEt, PreBTag_EvtWt);
			h_PFMetVsGJmass[1]          ->Fill(GetInvtMass(PC, JC), pfMET, PreBTag_EvtWt);
			h_PFMetOverSumEtVsGJmass[1] ->Fill(GetInvtMass(PC, JC), pfMET/pfMETsumEt, PreBTag_EvtWt);
		      	h_MetByPhPt[1]              ->Fill(pfMET/(*phoEt)[PC], PreBTag_EvtWt);    

			//Photon vs Jet dist for noBTag_noMasscut 
			h_PhPt_vs_bJetPt[1]         ->Fill((*phoEt)[PC], (*jetPt)[JC], PreBTag_EvtWt);
			h_PhEta_vs_bJetEta[1]       ->Fill((*phoSCEta)[PC], (*jetEta)[JC], PreBTag_EvtWt);
		      
			//CSVv2 discriminator distributions for noBTag_noMasscut 
			h_CSVv2Dist[1]              ->Fill((*jetCSV2BJetTags)[JC], PreBTag_EvtWt);
			h_CSVv2_vs_bJetPt[1]        ->Fill((*jetPt)[JC], (*jetCSV2BJetTags)[JC], PreBTag_EvtWt);
			h_CSVv2_vs_bJetEta[1]       ->Fill((*jetEta)[JC], (*jetCSV2BJetTags)[JC], PreBTag_EvtWt);

			//Primary vertex and number of photon and jets for noBTag_noMasscut 
			h_goodPV_LumiWt_noMassCut        ->Fill(GoodVertex, Lumi_EvtWt);
			h_goodPV_TotalWt[1]              ->Fill(GoodVertex, PreBTag_EvtWt);
			h_nIsoPhotons[1]                 ->Fill(GoodIsoPhotons.size(), PreBTag_EvtWt);  // Tot # of isolated photons
			h_nGoodPhotons[1]                ->Fill(GoodIsoBarrelPhotons.size(), PreBTag_EvtWt); // Tot # of isolated photons with pt > cut and eta < cut 
			for(int ip = 0; ip < GoodIsoPhotons.size(); ip++){
			  h_IsoPhotonIdxVsPt[1]          ->Fill((*phoEt)[GoodIsoPhotons[ip]], ip+1, PreBTag_EvtWt);
			}
			for(int ii = 0; ii < GoodIsoBarrelPhotons.size(); ii++){
			  h_GoodPhotonIdxVsPt[1]         ->Fill((*phoEt)[GoodIsoBarrelPhotons[ii]], ii+1, PreBTag_EvtWt);
			}				    
			h_nJets[1]                       ->Fill(GoodIsoJets.size(), PreBTag_EvtWt);
			for(int ij = 0; ij < GoodIsoJets.size(); ij++){
			  h_JetIdxVsPt[1]                ->Fill((*jetPt)[GoodIsoJets[ij]], ij+1, PreBTag_EvtWt);
			}
			//------------------------------------------------------------

			//Photon and Jet index for noBTag_noMasscut only
			h_PC                          ->Fill(PC);
			h_JC                          ->Fill(JC);
		      
			if(Pass_GJInvtMass){
			  h_CutFlow_qstar->Fill(11.5);
			  h_CutFlowWt_qstar->Fill(11.5, PreBTag_EvtWt);
			  
			  //----------------------------------------------------------
			  //[2]
			  //Photon distributions noBTag_Masscut
			  h_PhotonPt[2]               ->Fill((*phoEt)[PC], PreBTag_EvtWt);
			  h_PhotonCalibPt[2]          ->Fill((*phoCalibEt)[PC], PreBTag_EvtWt);
			  h_PhotonEta[2]              ->Fill((*phoSCEta)[PC], PreBTag_EvtWt);
			  h_PhotonPhi[2]              ->Fill((*phoSCPhi)[PC], PreBTag_EvtWt);
			  h_Photon_SigmaIEtaIEta[2]   ->Fill((*phoSigmaIEtaIEtaFull5x5)[PC], PreBTag_EvtWt);
			  h_Photon_R9[2]              ->Fill((*phoR9)[PC], PreBTag_EvtWt);
			  h_Photon_HoverE[2]          ->Fill((*phoHoverE)[PC], PreBTag_EvtWt);
			  h_Photon_EleVeto[2]         ->Fill((*phoEleVeto)[PC], PreBTag_EvtWt);
			  h_Photon_CorrPFChIso[2]     ->Fill(TMath::Max(((*phoPFChIso)[PC] - rho*EAChargedHadrons((*phoSCEta)[PC])), 0.0), PreBTag_EvtWt);
			  h_Photon_CorrPFNeuIso[2]    ->Fill(TMath::Max(((*phoPFNeuIso)[PC] - rho*EANeutralHadrons((*phoSCEta)[PC])), 0.0), PreBTag_EvtWt);
			  h_Photon_CorrPFPhoIso[2]    ->Fill(TMath::Max(((*phoPFPhoIso)[PC] - rho*EAPhotons((*phoSCEta)[PC])), 0.0), PreBTag_EvtWt);
		      
			  //Jet distributions noBTag_Masscut  
			  h_bJetPt[2]                 ->Fill((*jetPt)[JC], PreBTag_EvtWt);
			  h_bJetEta[2]                ->Fill((*jetEta)[JC], PreBTag_EvtWt);
			  h_bJetPhi[2]                ->Fill((*jetPhi)[JC], PreBTag_EvtWt);
			  h_bJet_Mt[2]                ->Fill((*jetMt)[JC], PreBTag_EvtWt);
			  h_bJet_area[2]              ->Fill((*jetArea)[JC], PreBTag_EvtWt);
			  h_bJet_Mass[2]              ->Fill((*jetMass)[JC], PreBTag_EvtWt);
			  h_bJet_NHEF[2]              ->Fill((*jetNHF)[JC], PreBTag_EvtWt);
			  h_bJet_NEEF[2]              ->Fill((*jetNEF)[JC], PreBTag_EvtWt);
			  h_bJet_NConst[2]            ->Fill((*jetNConstituents)[JC], PreBTag_EvtWt);
			  h_bJet_CHEF[2]              ->Fill((*jetCHF)[JC], PreBTag_EvtWt);
			  h_bJet_ChMult[2]            ->Fill((*jetNCH)[JC], PreBTag_EvtWt);
			  h_bJet_CEEF[2]              ->Fill((*jetCEF)[JC], PreBTag_EvtWt);
			  h_bJet_MUF[2]               ->Fill((*jetMUF)[JC], PreBTag_EvtWt);
			  h_bJet_NNP[2]               ->Fill((*jetNNP)[JC], PreBTag_EvtWt);
		      
			  //Photon+Jet distributions noBTag_Masscut 
			  h_GbJetInvtMass_VarBin[2]   ->Fill(GetInvtMass(PC, JC), PreBTag_EvtWt);
			  h_GbJetInvtMass_UnitBin[2]  ->Fill(GetInvtMass(PC, JC), PreBTag_EvtWt);
			  h_GbJet_dEta[2]             ->Fill(GetdEta((*phoSCEta)[PC], (*jetEta)[JC]), PreBTag_EvtWt);
			  h_GbJet_dPhi[2]             ->Fill(GetdPhi((*phoSCPhi)[PC], (*jetPhi)[JC]), PreBTag_EvtWt);
			  h_GbJet_dR[2]               ->Fill(GetdR((*phoSCEta)[PC], (*jetEta)[JC], (*phoSCPhi)[PC], (*jetPhi)[JC]), PreBTag_EvtWt);
			  h_cosThetaStar[2]           ->Fill(GetCosThetaStar((*phoSCEta)[PC], (*jetEta)[JC]), PreBTag_EvtWt);
		      
			  //PFMet distributions for noBTag_Masscut 
			  h_PFMet[2]                  ->Fill(pfMET, PreBTag_EvtWt);
			  h_SumPFMet[2]               ->Fill(pfMETsumEt, PreBTag_EvtWt);
			  h_MetBySumMET[2]            ->Fill(pfMET/pfMETsumEt, PreBTag_EvtWt);
			  h_PFMetVsGJmass[2]          ->Fill(GetInvtMass(PC, JC), pfMET, PreBTag_EvtWt);
			  h_PFMetOverSumEtVsGJmass[2] ->Fill(GetInvtMass(PC, JC), pfMET/pfMETsumEt, PreBTag_EvtWt);
			  h_MetByPhPt[2]              ->Fill(pfMET/(*phoEt)[PC], PreBTag_EvtWt);   

			  //Photon vs Jet dist for noBTag_Masscut 
			  h_PhPt_vs_bJetPt[2]         ->Fill((*phoEt)[PC], (*jetPt)[JC], PreBTag_EvtWt);
			  h_PhEta_vs_bJetEta[2]       ->Fill((*phoSCEta)[PC], (*jetEta)[JC], PreBTag_EvtWt);
		      
			  //CSVv2 discriminator distributions for noBTag_Masscut 
			  h_CSVv2Dist[2]              ->Fill((*jetCSV2BJetTags)[JC], PreBTag_EvtWt);
			  h_CSVv2_vs_bJetPt[2]        ->Fill((*jetPt)[JC], (*jetCSV2BJetTags)[JC], PreBTag_EvtWt);
			  h_CSVv2_vs_bJetEta[2]       ->Fill((*jetEta)[JC], (*jetCSV2BJetTags)[JC], PreBTag_EvtWt);

			  //Primary vertex and number of photon and jets for noBTag_Masscut 
			  h_goodPV_TotalWt[2]              ->Fill(GoodVertex, PreBTag_EvtWt);
			  h_nIsoPhotons[2]                 ->Fill(GoodIsoPhotons.size(), PreBTag_EvtWt);  // Tot # of isolated photons
			  h_nGoodPhotons[2]                ->Fill(GoodIsoBarrelPhotons.size(), PreBTag_EvtWt); // Tot # of isolated photons with pt > cut and eta < cut 
			  for(int ip = 0; ip < GoodIsoPhotons.size(); ip++){
			    h_IsoPhotonIdxVsPt[2]          ->Fill((*phoEt)[GoodIsoPhotons[ip]], ip+1, PreBTag_EvtWt);
			  }
			  for(int ii = 0; ii < GoodIsoBarrelPhotons.size(); ii++){
			    h_GoodPhotonIdxVsPt[2]         ->Fill((*phoEt)[GoodIsoBarrelPhotons[ii]], ii+1, PreBTag_EvtWt);
			  }				    
			  h_nJets[2]                       ->Fill(GoodIsoJets.size(), PreBTag_EvtWt);
			  for(int ij = 0; ij < GoodIsoJets.size(); ij++){
			    h_JetIdxVsPt[2]                ->Fill((*jetPt)[GoodIsoJets[ij]], ij+1, PreBTag_EvtWt);
			  }
			  //------------------------------------------------------------
			
			}//if(Pass_GJInvtMass)			
		      }//if(Pass_GJdEta)
		    }//if(Pass_GJdPhi)
		  }//Pass_JetEta
		}//Pass_JetPt
	      }//JC > -1
	    }//PC > -1
	  }//PhotonID
	}//HasPrimaryVtx
      }//Pass_HLT
      //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

      //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      //                     BSTAR
      //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      if(Pass_HLT){
	h_CutFlow_bstar->Fill(1.5);
	h_CutFlowWt_bstar->Fill(1.5, PreBTag_EvtWt);
	h_CutFlowTotalWt_bstar->Fill(1.5, PreBTag_EvtWt);
         
	if(HasPrimaryVtx){
	  h_CutFlow_bstar->Fill(2.5);
	  h_CutFlowWt_bstar->Fill(2.5, PreBTag_EvtWt);
	  h_CutFlowTotalWt_bstar->Fill(2.5, PreBTag_EvtWt);

	  if(GoodIsoPhotons.size() > 0){
	    h_CutFlow_bstar->Fill(3.5);
	    h_CutFlowWt_bstar->Fill(3.5, PreBTag_EvtWt);
	    h_CutFlowTotalWt_bstar->Fill(3.5, PreBTag_EvtWt);

	    if(PC > -1){
	      h_CutFlow_bstar->Fill(4.5);
	      h_CutFlowWt_bstar->Fill(4.5, PreBTag_EvtWt);
	      h_CutFlowTotalWt_bstar->Fill(4.5, PreBTag_EvtWt);

	      if(JC > -1){
		h_CutFlow_bstar->Fill(5.5);
		h_CutFlowWt_bstar->Fill(5.5, PreBTag_EvtWt);
		h_CutFlowTotalWt_bstar->Fill(5.5, PreBTag_EvtWt);

		if(Pass_JetPt){
		  h_CutFlow_bstar->Fill(6.5);
		  h_CutFlowWt_bstar->Fill(6.5, PreBTag_EvtWt);
		  h_CutFlowTotalWt_bstar->Fill(6.5, PreBTag_EvtWt);

		  if(Pass_JetEta){
		    h_CutFlow_bstar->Fill(7.5);
		    h_CutFlowWt_bstar->Fill(7.5, PreBTag_EvtWt);
		    h_CutFlowTotalWt_bstar->Fill(7.5, PreBTag_EvtWt);

		    if(Pass_CSVv2bTag){
		      h_CutFlow_bstar->Fill(8.5);
		      h_CutFlowWt_bstar->Fill(8.5, PreBTag_EvtWt);

		      Double_t SF, Wt_1Tag, Wt_0Tag;
		      Double_t SFerr;
		      BTagEntry::JetFlavor JF;
		      std::string sys_type = "central"; //central is required to get scale factors (up and down for uncertainties) 
		      if(fabs((*jetHadFlvr)[JC]) == 5) JF = BTagEntry::FLAV_B; //b
		      if(fabs((*jetHadFlvr)[JC]) == 4) JF = BTagEntry::FLAV_C; //c
		      if(fabs((*jetHadFlvr)[JC]) == 0) JF = BTagEntry::FLAV_UDSG; //u,d,s,g,undefined

		      SF = CSVv2bTagSF_auto(CSV_OP, JF, sys_type, (*jetPt)[JC], (*jetEta)[JC]);
		      SFerr = CSVv2bTagSF_auto(CSV_OP, JF, "up", (*jetPt)[JC], (*jetEta)[JC]);

		      h_bTag_SF->Fill(SF);

		      if(JF == BTagEntry::FLAV_B){
			h_BTagSF_vs_pt[0]->Fill((*jetPt)[JC], SF, PreBTag_EvtWt);
			h_BTagSFerr_vs_pt[0]->Fill((*jetPt)[JC], SFerr-SF, PreBTag_EvtWt);
		      }
		      if(JF == BTagEntry::FLAV_C){
			h_BTagSF_vs_pt[1]->Fill((*jetPt)[JC], SF, PreBTag_EvtWt);
			h_BTagSFerr_vs_pt[1]->Fill((*jetPt)[JC], SFerr-SF, PreBTag_EvtWt);
		      }
		      if(JF == BTagEntry::FLAV_UDSG){
			h_BTagSF_vs_pt[2]->Fill((*jetPt)[JC], SF, PreBTag_EvtWt);
			h_BTagSFerr_vs_pt[2]->Fill((*jetPt)[JC], SFerr-SF, PreBTag_EvtWt);
		      }

		      Wt_1Tag = BTagEventWeight(SF, 1); // SF
		      Wt_0Tag = BTagEventWeight(SF, 0); // (1-SF)  

		      h_bTag_EvtWt_1Tag->Fill(Wt_1Tag);
		      h_bTag_EvtWt_0Tag->Fill(Wt_0Tag);

		      Total_EvtWt_1tag = PreBTag_EvtWt * Wt_1Tag;
		      Total_EvtWt_0tag = PreBTag_EvtWt * Wt_0Tag;

		      h_CutFlowTotalWt_bstar->Fill(8.5, Total_EvtWt_1tag);
		      h_CutFlowTotalWt_bstar->Fill(12.5, Total_EvtWt_0tag);

		      if(Pass_GJdPhi){
			h_CutFlow_bstar->Fill(9.5);
			h_CutFlowWt_bstar->Fill(9.5, PreBTag_EvtWt);
			h_CutFlowTotalWt_bstar->Fill(9.5, Total_EvtWt_1tag);
			h_CutFlowTotalWt_bstar->Fill(13.5, Total_EvtWt_0tag);

			if(Pass_GJdEta){
			  h_CutFlow_bstar->Fill(10.5);
			  h_CutFlowWt_bstar->Fill(10.5, PreBTag_EvtWt);
			  h_CutFlowTotalWt_bstar->Fill(10.5, Total_EvtWt_1tag);
			  h_CutFlowTotalWt_bstar->Fill(14.5, Total_EvtWt_0tag);

			  //For PassCSVv2Tag, Both 1 and 0 btag categories will be filled with corresponding weights.
			  //1Btag Category (BTagWt = SF for 1 BTag Category)
			  //----------------------------------------------------------
			  //[3]
			  //Photon distributions 1BTag_noMasscut
			  h_PhotonPt[3]               ->Fill((*phoEt)[PC], Total_EvtWt_1tag);
			  h_PhotonCalibPt[3]          ->Fill((*phoCalibEt)[PC], Total_EvtWt_1tag);
			  h_PhotonEta[3]              ->Fill((*phoSCEta)[PC], Total_EvtWt_1tag);
			  h_PhotonPhi[3]              ->Fill((*phoSCPhi)[PC], Total_EvtWt_1tag);
			  h_Photon_SigmaIEtaIEta[3]   ->Fill((*phoSigmaIEtaIEtaFull5x5)[PC], Total_EvtWt_1tag);
			  h_Photon_R9[3]              ->Fill((*phoR9)[PC], Total_EvtWt_1tag);
			  h_Photon_HoverE[3]          ->Fill((*phoHoverE)[PC], Total_EvtWt_1tag);
			  h_Photon_EleVeto[3]         ->Fill((*phoEleVeto)[PC], Total_EvtWt_1tag);
			  h_Photon_CorrPFChIso[3]     ->Fill(TMath::Max(((*phoPFChIso)[PC] - rho*EAChargedHadrons((*phoSCEta)[PC])), 0.0), Total_EvtWt_1tag);
			  h_Photon_CorrPFNeuIso[3]    ->Fill(TMath::Max(((*phoPFNeuIso)[PC] - rho*EANeutralHadrons((*phoSCEta)[PC])), 0.0), Total_EvtWt_1tag);
			  h_Photon_CorrPFPhoIso[3]    ->Fill(TMath::Max(((*phoPFPhoIso)[PC] - rho*EAPhotons((*phoSCEta)[PC])), 0.0), Total_EvtWt_1tag);		      

			  //Jet distributions 1BTag_noMasscut 
			  h_bJetPt[3]                 ->Fill((*jetPt)[JC], Total_EvtWt_1tag);
			  h_bJetEta[3]                ->Fill((*jetEta)[JC], Total_EvtWt_1tag);
			  h_bJetPhi[3]                ->Fill((*jetPhi)[JC], Total_EvtWt_1tag);
			  h_bJet_Mt[3]                ->Fill((*jetMt)[JC], Total_EvtWt_1tag);
			  h_bJet_area[3]              ->Fill((*jetArea)[JC], Total_EvtWt_1tag);
			  h_bJet_Mass[3]              ->Fill((*jetMass)[JC], Total_EvtWt_1tag);
			  h_bJet_NHEF[3]              ->Fill((*jetNHF)[JC], Total_EvtWt_1tag);
			  h_bJet_NEEF[3]              ->Fill((*jetNEF)[JC], Total_EvtWt_1tag);
			  h_bJet_NConst[3]            ->Fill((*jetNConstituents)[JC], Total_EvtWt_1tag);
			  h_bJet_CHEF[3]              ->Fill((*jetCHF)[JC], Total_EvtWt_1tag);
			  h_bJet_ChMult[3]            ->Fill((*jetNCH)[JC], Total_EvtWt_1tag);
			  h_bJet_CEEF[3]              ->Fill((*jetCEF)[JC], Total_EvtWt_1tag);
			  h_bJet_MUF[3]               ->Fill((*jetMUF)[JC], Total_EvtWt_1tag);
			  h_bJet_NNP[3]               ->Fill((*jetNNP)[JC], Total_EvtWt_1tag);
		      
			  //Photon+Jet distributions 1BTag_noMasscut 
			  h_GbJetInvtMass_VarBin[3]   ->Fill(GetInvtMass(PC, JC), Total_EvtWt_1tag);
			  h_GbJetInvtMass_UnitBin[3]  ->Fill(GetInvtMass(PC, JC), Total_EvtWt_1tag);
			  h_GbJet_dEta[3]             ->Fill(GetdEta((*phoSCEta)[PC], (*jetEta)[JC]), Total_EvtWt_1tag);
			  h_GbJet_dPhi[3]             ->Fill(GetdPhi((*phoSCPhi)[PC], (*jetPhi)[JC]), Total_EvtWt_1tag);
			  h_GbJet_dR[3]               ->Fill(GetdR((*phoSCEta)[PC], (*jetEta)[JC], (*phoSCPhi)[PC], (*jetPhi)[JC]), Total_EvtWt_1tag);
			  h_cosThetaStar[3]           ->Fill(GetCosThetaStar((*phoSCEta)[PC], (*jetEta)[JC]), Total_EvtWt_1tag);
		      
			  //PFMet distributions for 1BTag_noMasscut 
			  h_PFMet[3]                  ->Fill(pfMET, Total_EvtWt_1tag);
			  h_SumPFMet[3]               ->Fill(pfMETsumEt, Total_EvtWt_1tag);
			  h_MetBySumMET[3]            ->Fill(pfMET/pfMETsumEt, Total_EvtWt_1tag);
			  h_PFMetVsGJmass[3]          ->Fill(GetInvtMass(PC, JC), pfMET, Total_EvtWt_1tag);
			  h_PFMetOverSumEtVsGJmass[3] ->Fill(GetInvtMass(PC, JC), pfMET/pfMETsumEt, Total_EvtWt_1tag);
			  h_MetByPhPt[3]              ->Fill(pfMET/(*phoEt)[PC], Total_EvtWt_1tag);   

			  //Photon vs Jet dist for 1BTag_noMasscut 
			  h_PhPt_vs_bJetPt[3]         ->Fill((*phoEt)[PC], (*jetPt)[JC], Total_EvtWt_1tag);
			  h_PhEta_vs_bJetEta[3]       ->Fill((*phoSCEta)[PC], (*jetEta)[JC], Total_EvtWt_1tag);
		      
			  //CSVv2 discriminator distributions for 1BTag_noMasscut 
			  h_CSVv2Dist[3]              ->Fill((*jetCSV2BJetTags)[JC], Total_EvtWt_1tag);
			  h_CSVv2_vs_bJetPt[3]        ->Fill((*jetPt)[JC], (*jetCSV2BJetTags)[JC], Total_EvtWt_1tag);
			  h_CSVv2_vs_bJetEta[3]       ->Fill((*jetEta)[JC], (*jetCSV2BJetTags)[JC], Total_EvtWt_1tag);

			  //Primary vertex and number of photon and jets for 1BTag_noMasscut 
			  h_goodPV_TotalWt[3]              ->Fill(GoodVertex, Total_EvtWt_1tag);
			  h_nIsoPhotons[3]                 ->Fill(GoodIsoPhotons.size(), Total_EvtWt_1tag);  // Tot # of isolated photons
			  h_nGoodPhotons[3]                ->Fill(GoodIsoBarrelPhotons.size(), Total_EvtWt_1tag); // Tot # of isolated photons with pt > cut and eta < cut 
			  for(int ip = 0; ip < GoodIsoPhotons.size(); ip++){
			    h_IsoPhotonIdxVsPt[3]          ->Fill((*phoEt)[GoodIsoPhotons[ip]], ip+1, Total_EvtWt_1tag);
			  }
			  for(int ii = 0; ii < GoodIsoBarrelPhotons.size(); ii++){
			    h_GoodPhotonIdxVsPt[3]         ->Fill((*phoEt)[GoodIsoBarrelPhotons[ii]], ii+1, Total_EvtWt_1tag);
			  }				    
			  h_nJets[3]                       ->Fill(GoodIsoJets.size(), Total_EvtWt_1tag);
			  for(int ij = 0; ij < GoodIsoJets.size(); ij++){
			    h_JetIdxVsPt[3]                ->Fill((*jetPt)[GoodIsoJets[ij]], ij+1, Total_EvtWt_1tag);
			  }
			  //------------------------------------------------------------

			  //0BTag Category (BTagWt = 1-SF for 0Btag category)
			  //Photon distributions 0BTag_noMasscut
			  h_PhotonPt[5]               ->Fill((*phoEt)[PC], Total_EvtWt_0tag);
			  h_PhotonCalibPt[5]          ->Fill((*phoCalibEt)[PC], Total_EvtWt_0tag);
			  h_PhotonEta[5]              ->Fill((*phoSCEta)[PC], Total_EvtWt_0tag);
			  h_PhotonPhi[5]              ->Fill((*phoSCPhi)[PC], Total_EvtWt_0tag);
			  h_Photon_SigmaIEtaIEta[5]   ->Fill((*phoSigmaIEtaIEtaFull5x5)[PC], Total_EvtWt_0tag);
			  h_Photon_R9[5]              ->Fill((*phoR9)[PC], Total_EvtWt_0tag);
			  h_Photon_HoverE[5]          ->Fill((*phoHoverE)[PC], Total_EvtWt_0tag);
			  h_Photon_EleVeto[5]         ->Fill((*phoEleVeto)[PC], Total_EvtWt_0tag);
			  h_Photon_CorrPFChIso[5]     ->Fill(TMath::Max(((*phoPFChIso)[PC] - rho*EAChargedHadrons((*phoSCEta)[PC])), 0.0), Total_EvtWt_0tag);
			  h_Photon_CorrPFNeuIso[5]    ->Fill(TMath::Max(((*phoPFNeuIso)[PC] - rho*EANeutralHadrons((*phoSCEta)[PC])), 0.0), Total_EvtWt_0tag);
			  h_Photon_CorrPFPhoIso[5]    ->Fill(TMath::Max(((*phoPFPhoIso)[PC] - rho*EAPhotons((*phoSCEta)[PC])), 0.0), Total_EvtWt_0tag);
		      
			  //Jet distributions 0BTag_noMasscut 
			  h_bJetPt[5]                 ->Fill((*jetPt)[JC], Total_EvtWt_0tag);
			  h_bJetEta[5]                ->Fill((*jetEta)[JC], Total_EvtWt_0tag);
			  h_bJetPhi[5]                ->Fill((*jetPhi)[JC], Total_EvtWt_0tag);
			  h_bJet_Mt[5]                ->Fill((*jetMt)[JC], Total_EvtWt_0tag);
			  h_bJet_area[5]              ->Fill((*jetArea)[JC], Total_EvtWt_0tag);
			  h_bJet_Mass[5]              ->Fill((*jetMass)[JC], Total_EvtWt_0tag);
			  h_bJet_NHEF[5]              ->Fill((*jetNHF)[JC], Total_EvtWt_0tag);
			  h_bJet_NEEF[5]              ->Fill((*jetNEF)[JC], Total_EvtWt_0tag);
			  h_bJet_NConst[5]            ->Fill((*jetNConstituents)[JC], Total_EvtWt_0tag);
			  h_bJet_CHEF[5]              ->Fill((*jetCHF)[JC], Total_EvtWt_0tag);
			  h_bJet_ChMult[5]            ->Fill((*jetNCH)[JC], Total_EvtWt_0tag);
			  h_bJet_CEEF[5]              ->Fill((*jetCEF)[JC], Total_EvtWt_0tag);
			  h_bJet_MUF[5]               ->Fill((*jetMUF)[JC], Total_EvtWt_0tag);
			  h_bJet_NNP[5]               ->Fill((*jetNNP)[JC], Total_EvtWt_0tag);
		      
			  //Photon+Jet distributions 0BTag_noMasscut 
			  h_GbJetInvtMass_VarBin[5]   ->Fill(GetInvtMass(PC, JC), Total_EvtWt_0tag);
			  h_GbJetInvtMass_UnitBin[5]  ->Fill(GetInvtMass(PC, JC), Total_EvtWt_0tag);
			  h_GbJet_dEta[5]             ->Fill(GetdEta((*phoSCEta)[PC], (*jetEta)[JC]), Total_EvtWt_0tag);
			  h_GbJet_dPhi[5]             ->Fill(GetdPhi((*phoSCPhi)[PC], (*jetPhi)[JC]), Total_EvtWt_0tag);
			  h_GbJet_dR[5]               ->Fill(GetdR((*phoSCEta)[PC], (*jetEta)[JC], (*phoSCPhi)[PC], (*jetPhi)[JC]), Total_EvtWt_0tag);
			  h_cosThetaStar[5]           ->Fill(GetCosThetaStar((*phoSCEta)[PC], (*jetEta)[JC]), Total_EvtWt_0tag);
		      
			  //PFMet distributions for 0BTag_noMasscut 
			  h_PFMet[5]                  ->Fill(pfMET, Total_EvtWt_0tag);
			  h_SumPFMet[5]               ->Fill(pfMETsumEt, Total_EvtWt_0tag);
			  h_MetBySumMET[5]            ->Fill(pfMET/pfMETsumEt, Total_EvtWt_0tag);
			  h_PFMetVsGJmass[5]          ->Fill(GetInvtMass(PC, JC), pfMET, Total_EvtWt_0tag);
			  h_PFMetOverSumEtVsGJmass[5] ->Fill(GetInvtMass(PC, JC), pfMET/pfMETsumEt, Total_EvtWt_0tag);
			  h_MetByPhPt[5]              ->Fill(pfMET/(*phoEt)[PC], Total_EvtWt_0tag);  

			  //Photon vs Jet dist for 0BTag_noMasscut 
			  h_PhPt_vs_bJetPt[5]         ->Fill((*phoEt)[PC], (*jetPt)[JC], Total_EvtWt_0tag);
			  h_PhEta_vs_bJetEta[5]       ->Fill((*phoSCEta)[PC], (*jetEta)[JC], Total_EvtWt_0tag);
		      
			  //CSVv2 discriminator distributions for 0BTag_noMasscut 
			  h_CSVv2Dist[5]              ->Fill((*jetCSV2BJetTags)[JC], Total_EvtWt_0tag);
			  h_CSVv2_vs_bJetPt[5]        ->Fill((*jetPt)[JC], (*jetCSV2BJetTags)[JC], Total_EvtWt_0tag);
			  h_CSVv2_vs_bJetEta[5]       ->Fill((*jetEta)[JC], (*jetCSV2BJetTags)[JC], Total_EvtWt_0tag);

			  //Primary vertex and number of photon and jets for 0BTag_noMasscut 
			  h_goodPV_TotalWt[5]              ->Fill(GoodVertex, Total_EvtWt_0tag);
			  h_nIsoPhotons[5]                 ->Fill(GoodIsoPhotons.size(), Total_EvtWt_0tag);  // Tot # of isolated photons
			  h_nGoodPhotons[5]                ->Fill(GoodIsoBarrelPhotons.size(), Total_EvtWt_0tag); // Tot # of isolated photons with pt > cut and eta < cut 
			  for(int ip = 0; ip < GoodIsoPhotons.size(); ip++){
			    h_IsoPhotonIdxVsPt[5]          ->Fill((*phoEt)[GoodIsoPhotons[ip]], ip+1, Total_EvtWt_0tag);
			  }
			  for(int ii = 0; ii < GoodIsoBarrelPhotons.size(); ii++){
			    h_GoodPhotonIdxVsPt[5]         ->Fill((*phoEt)[GoodIsoBarrelPhotons[ii]], ii+1, Total_EvtWt_0tag);
			  }				    
			  h_nJets[5]                       ->Fill(GoodIsoJets.size(), Total_EvtWt_0tag);
			  for(int ij = 0; ij < GoodIsoJets.size(); ij++){
			    h_JetIdxVsPt[5]                ->Fill((*jetPt)[GoodIsoJets[ij]], ij+1, Total_EvtWt_0tag);
			  }
			  //------------------------------------------------------------

			  if(Pass_GJInvtMass){
			    h_CutFlow_bstar->Fill(11.5);
			    h_CutFlowWt_bstar->Fill(11.5, PreBTag_EvtWt);
			    h_CutFlowTotalWt_bstar->Fill(11.5, Total_EvtWt_1tag);
			    h_CutFlowTotalWt_bstar->Fill(15.5, Total_EvtWt_0tag);

				
			    //1Btag Category (BTagWt = SF for 1 BTag Category)
			    //----------------------------------------------------------
			    //[4]
			    //Photon distributions 1BTag_Masscut
			    h_PhotonPt[4]               ->Fill((*phoEt)[PC], Total_EvtWt_1tag);
			    h_PhotonCalibPt[4]          ->Fill((*phoCalibEt)[PC], Total_EvtWt_1tag);
			    h_PhotonEta[4]              ->Fill((*phoSCEta)[PC], Total_EvtWt_1tag);
			    h_PhotonPhi[4]              ->Fill((*phoSCPhi)[PC], Total_EvtWt_1tag);
			    h_Photon_SigmaIEtaIEta[4]   ->Fill((*phoSigmaIEtaIEtaFull5x5)[PC], Total_EvtWt_1tag);
			    h_Photon_R9[4]              ->Fill((*phoR9)[PC], Total_EvtWt_1tag);
			    h_Photon_HoverE[4]          ->Fill((*phoHoverE)[PC], Total_EvtWt_1tag);
			    h_Photon_EleVeto[4]         ->Fill((*phoEleVeto)[PC], Total_EvtWt_1tag);
			    h_Photon_CorrPFChIso[4]     ->Fill(TMath::Max(((*phoPFChIso)[PC] - rho*EAChargedHadrons((*phoSCEta)[PC])), 0.0), Total_EvtWt_1tag);
			    h_Photon_CorrPFNeuIso[4]    ->Fill(TMath::Max(((*phoPFNeuIso)[PC] - rho*EANeutralHadrons((*phoSCEta)[PC])), 0.0), Total_EvtWt_1tag);
			    h_Photon_CorrPFPhoIso[4]    ->Fill(TMath::Max(((*phoPFPhoIso)[PC] - rho*EAPhotons((*phoSCEta)[PC])), 0.0), Total_EvtWt_1tag);
		      
			    //Jet distributions 1BTag_Masscut 
			    h_bJetPt[4]                 ->Fill((*jetPt)[JC], Total_EvtWt_1tag);
			    h_bJetEta[4]                ->Fill((*jetEta)[JC], Total_EvtWt_1tag);
			    h_bJetPhi[4]                ->Fill((*jetPhi)[JC], Total_EvtWt_1tag);
			    h_bJet_Mt[4]                ->Fill((*jetMt)[JC], Total_EvtWt_1tag);
			    h_bJet_area[4]              ->Fill((*jetArea)[JC], Total_EvtWt_1tag);
			    h_bJet_Mass[4]              ->Fill((*jetMass)[JC], Total_EvtWt_1tag);
			    h_bJet_NHEF[4]              ->Fill((*jetNHF)[JC], Total_EvtWt_1tag);
			    h_bJet_NEEF[4]              ->Fill((*jetNEF)[JC], Total_EvtWt_1tag);
			    h_bJet_NConst[4]            ->Fill((*jetNConstituents)[JC], Total_EvtWt_1tag);
			    h_bJet_CHEF[4]              ->Fill((*jetCHF)[JC], Total_EvtWt_1tag);
			    h_bJet_ChMult[4]            ->Fill((*jetNCH)[JC], Total_EvtWt_1tag);
			    h_bJet_CEEF[4]              ->Fill((*jetCEF)[JC], Total_EvtWt_1tag);
			    h_bJet_MUF[4]               ->Fill((*jetMUF)[JC], Total_EvtWt_1tag);
			    h_bJet_NNP[4]               ->Fill((*jetNNP)[JC], Total_EvtWt_1tag);
			    
			    //Photon+Jet distributions 1BTag_Masscut 
			    h_GbJetInvtMass_VarBin[4]   ->Fill(GetInvtMass(PC, JC), Total_EvtWt_1tag);
			    h_GbJetInvtMass_UnitBin[4]  ->Fill(GetInvtMass(PC, JC), Total_EvtWt_1tag);
			    h_GbJet_dEta[4]             ->Fill(GetdEta((*phoSCEta)[PC], (*jetEta)[JC]), Total_EvtWt_1tag);
			    h_GbJet_dPhi[4]             ->Fill(GetdPhi((*phoSCPhi)[PC], (*jetPhi)[JC]), Total_EvtWt_1tag);
			    h_GbJet_dR[4]               ->Fill(GetdR((*phoSCEta)[PC], (*jetEta)[JC], (*phoSCPhi)[PC], (*jetPhi)[JC]), Total_EvtWt_1tag);
			    h_cosThetaStar[4]           ->Fill(GetCosThetaStar((*phoSCEta)[PC], (*jetEta)[JC]), Total_EvtWt_1tag);
		     
			    //PFMet distributions for 1BTag_Masscut 
			    h_PFMet[4]                  ->Fill(pfMET, Total_EvtWt_1tag);
			    h_SumPFMet[4]               ->Fill(pfMETsumEt, Total_EvtWt_1tag);
			    h_MetBySumMET[4]            ->Fill(pfMET/pfMETsumEt, Total_EvtWt_1tag);
			    h_PFMetVsGJmass[4]          ->Fill(GetInvtMass(PC, JC), pfMET, Total_EvtWt_1tag);
			    h_PFMetOverSumEtVsGJmass[4] ->Fill(GetInvtMass(PC, JC), pfMET/pfMETsumEt, Total_EvtWt_1tag);
			    h_MetByPhPt[4]              ->Fill(pfMET/(*phoEt)[PC], Total_EvtWt_1tag);   

			    //Photon vs Jet dist for 1BTag_Masscut 
			    h_PhPt_vs_bJetPt[4]         ->Fill((*phoEt)[PC], (*jetPt)[JC], Total_EvtWt_1tag);
			    h_PhEta_vs_bJetEta[4]       ->Fill((*phoSCEta)[PC], (*jetEta)[JC], Total_EvtWt_1tag);
		      
			    //CSVv2 discriminator distributions for 1BTag_Masscut 
			    h_CSVv2Dist[4]              ->Fill((*jetCSV2BJetTags)[JC], Total_EvtWt_1tag);
			    h_CSVv2_vs_bJetPt[4]        ->Fill((*jetPt)[JC], (*jetCSV2BJetTags)[JC], Total_EvtWt_1tag);
			    h_CSVv2_vs_bJetEta[4]       ->Fill((*jetEta)[JC], (*jetCSV2BJetTags)[JC], Total_EvtWt_1tag);

			    //Primary vertex and number of photon and jets for 1BTag_Masscut 
			    h_goodPV_TotalWt[4]              ->Fill(GoodVertex, Total_EvtWt_1tag);
			    h_nIsoPhotons[4]                 ->Fill(GoodIsoPhotons.size(), Total_EvtWt_1tag);  // Tot # of isolated photons
			    h_nGoodPhotons[4]                ->Fill(GoodIsoBarrelPhotons.size(), Total_EvtWt_1tag); // Tot # of isolated photons with pt > cut and eta < cut 
			    for(int ip = 0; ip < GoodIsoPhotons.size(); ip++){
			      h_IsoPhotonIdxVsPt[4]          ->Fill((*phoEt)[GoodIsoPhotons[ip]], ip+1, Total_EvtWt_1tag);
			    }
			    for(int ii = 0; ii < GoodIsoBarrelPhotons.size(); ii++){
			      h_GoodPhotonIdxVsPt[4]         ->Fill((*phoEt)[GoodIsoBarrelPhotons[ii]], ii+1, Total_EvtWt_1tag);
			    }				   
			    h_nJets[4]                       ->Fill(GoodIsoJets.size(), Total_EvtWt_1tag);
			    for(int ij = 0; ij < GoodIsoJets.size(); ij++){
			      h_JetIdxVsPt[4]                ->Fill((*jetPt)[GoodIsoJets[ij]], ij+1, Total_EvtWt_1tag);
			    }
			    //------------------------------------------------------------

			    //0BTag Category (BTagWt = 1-SF for 0Btag category)
			    //Photon distributions 0BTag_Masscut
			    h_PhotonPt[6]               ->Fill((*phoEt)[PC], Total_EvtWt_0tag);
			    h_PhotonCalibPt[6]          ->Fill((*phoCalibEt)[PC], Total_EvtWt_0tag);
			    h_PhotonEta[6]              ->Fill((*phoSCEta)[PC], Total_EvtWt_0tag);
			    h_PhotonPhi[6]              ->Fill((*phoSCPhi)[PC], Total_EvtWt_0tag);
			    h_Photon_SigmaIEtaIEta[6]   ->Fill((*phoSigmaIEtaIEtaFull5x5)[PC], Total_EvtWt_0tag);
			    h_Photon_R9[6]              ->Fill((*phoR9)[PC], Total_EvtWt_0tag);
			    h_Photon_HoverE[6]          ->Fill((*phoHoverE)[PC], Total_EvtWt_0tag);
			    h_Photon_EleVeto[6]         ->Fill((*phoEleVeto)[PC], Total_EvtWt_0tag);
			    h_Photon_CorrPFChIso[6]     ->Fill(TMath::Max(((*phoPFChIso)[PC] - rho*EAChargedHadrons((*phoSCEta)[PC])), 0.0), Total_EvtWt_0tag);
			    h_Photon_CorrPFNeuIso[6]    ->Fill(TMath::Max(((*phoPFNeuIso)[PC] - rho*EANeutralHadrons((*phoSCEta)[PC])), 0.0), Total_EvtWt_0tag);
			    h_Photon_CorrPFPhoIso[6]    ->Fill(TMath::Max(((*phoPFPhoIso)[PC] - rho*EAPhotons((*phoSCEta)[PC])), 0.0), Total_EvtWt_0tag);
		      
			    //Jet distributions 0BTag_Masscut 
			    h_bJetPt[6]                 ->Fill((*jetPt)[JC], Total_EvtWt_0tag);
			    h_bJetEta[6]                ->Fill((*jetEta)[JC], Total_EvtWt_0tag);
			    h_bJetPhi[6]                ->Fill((*jetPhi)[JC], Total_EvtWt_0tag);
			    h_bJet_Mt[6]                ->Fill((*jetMt)[JC], Total_EvtWt_0tag);
			    h_bJet_area[6]              ->Fill((*jetArea)[JC], Total_EvtWt_0tag);
			    h_bJet_Mass[6]              ->Fill((*jetMass)[JC], Total_EvtWt_0tag);
			    h_bJet_NHEF[6]              ->Fill((*jetNHF)[JC], Total_EvtWt_0tag);
			    h_bJet_NEEF[6]              ->Fill((*jetNEF)[JC], Total_EvtWt_0tag);
			    h_bJet_NConst[6]            ->Fill((*jetNConstituents)[JC], Total_EvtWt_0tag);
			    h_bJet_CHEF[6]              ->Fill((*jetCHF)[JC], Total_EvtWt_0tag);
			    h_bJet_ChMult[6]            ->Fill((*jetNCH)[JC], Total_EvtWt_0tag);
			    h_bJet_CEEF[6]              ->Fill((*jetCEF)[JC], Total_EvtWt_0tag);
			    h_bJet_MUF[6]               ->Fill((*jetMUF)[JC], Total_EvtWt_0tag);
			    h_bJet_NNP[6]               ->Fill((*jetNNP)[JC], Total_EvtWt_0tag);
		      
			    //Photon+Jet distributions 0BTag_Masscut 
			    h_GbJetInvtMass_VarBin[6]   ->Fill(GetInvtMass(PC, JC), Total_EvtWt_0tag);
			    h_GbJetInvtMass_UnitBin[6]  ->Fill(GetInvtMass(PC, JC), Total_EvtWt_0tag);
			    h_GbJet_dEta[6]             ->Fill(GetdEta((*phoSCEta)[PC], (*jetEta)[JC]), Total_EvtWt_0tag);
			    h_GbJet_dPhi[6]             ->Fill(GetdPhi((*phoSCPhi)[PC], (*jetPhi)[JC]), Total_EvtWt_0tag);
			    h_GbJet_dR[6]               ->Fill(GetdR((*phoSCEta)[PC], (*jetEta)[JC], (*phoSCPhi)[PC], (*jetPhi)[JC]), Total_EvtWt_0tag);
			    h_cosThetaStar[6]           ->Fill(GetCosThetaStar((*phoSCEta)[PC], (*jetEta)[JC]), Total_EvtWt_0tag);
		      
			    //PFMet distributions for 0BTag_Masscut 
			    h_PFMet[6]                  ->Fill(pfMET, Total_EvtWt_0tag);
			    h_SumPFMet[6]               ->Fill(pfMETsumEt, Total_EvtWt_0tag);
			    h_MetBySumMET[6]            ->Fill(pfMET/pfMETsumEt, Total_EvtWt_0tag);
			    h_PFMetVsGJmass[6]          ->Fill(GetInvtMass(PC, JC), pfMET, Total_EvtWt_0tag);
			    h_PFMetOverSumEtVsGJmass[6] ->Fill(GetInvtMass(PC, JC), pfMET/pfMETsumEt, Total_EvtWt_0tag);
			    h_MetByPhPt[6]              ->Fill(pfMET/(*phoEt)[PC], Total_EvtWt_0tag);   

			    //Photon vs Jet dist for 0BTag_Masscut 
			    h_PhPt_vs_bJetPt[6]         ->Fill((*phoEt)[PC], (*jetPt)[JC], Total_EvtWt_0tag);
			    h_PhEta_vs_bJetEta[6]       ->Fill((*phoSCEta)[PC], (*jetEta)[JC], Total_EvtWt_0tag);
		      
			    //CSVv2 discriminator distributions for 0BTag_Masscut 
			    h_CSVv2Dist[6]              ->Fill((*jetCSV2BJetTags)[JC], Total_EvtWt_0tag);
			    h_CSVv2_vs_bJetPt[6]        ->Fill((*jetPt)[JC], (*jetCSV2BJetTags)[JC], Total_EvtWt_0tag);
			    h_CSVv2_vs_bJetEta[6]       ->Fill((*jetEta)[JC], (*jetCSV2BJetTags)[JC], Total_EvtWt_0tag);

			    //Primary vertex and number of photon and jets for 0BTag_Masscut 
			    h_goodPV_TotalWt[6]              ->Fill(GoodVertex, Total_EvtWt_0tag);
			    h_nIsoPhotons[6]                 ->Fill(GoodIsoPhotons.size(), Total_EvtWt_0tag);  // Tot # of isolated photons
			    h_nGoodPhotons[6]                ->Fill(GoodIsoBarrelPhotons.size(), Total_EvtWt_0tag); // Tot # of isolated photons with pt > cut and eta < cut 
			    for(int ip = 0; ip < GoodIsoPhotons.size(); ip++){
			      h_IsoPhotonIdxVsPt[6]          ->Fill((*phoEt)[GoodIsoPhotons[ip]], ip+1, Total_EvtWt_0tag);
			    }
			    for(int ii = 0; ii < GoodIsoBarrelPhotons.size(); ii++){
			      h_GoodPhotonIdxVsPt[6]         ->Fill((*phoEt)[GoodIsoBarrelPhotons[ii]], ii+1, Total_EvtWt_0tag);
			    }				    
			    h_nJets[6]                       ->Fill(GoodIsoJets.size(), Total_EvtWt_0tag);
			    for(int ij = 0; ij < GoodIsoJets.size(); ij++){
			      h_JetIdxVsPt[6]                ->Fill((*jetPt)[GoodIsoJets[ij]], ij+1, Total_EvtWt_0tag);
			    }
			    //------------------------------------------------------------

			  }//if(Pass_GJInvtMass) inside if(Pass_CSVv2bTag)
			}//if(Pass_GJdEta) inside if(Pass_CSVv2bTag)
		      }//if(Pass_GJdPhi) inside if(Pass_CSVv2bTag)		       

		    }//if(Pass_CSVv2bTag)		     
		    else{
		      h_CutFlow_bstar->Fill(12.5);
		      h_CutFlowWt_bstar->Fill(12.5, PreBTag_EvtWt);
		      h_CutFlowTotalWt_bstar->Fill(12.5, PreBTag_EvtWt);

		      if(Pass_GJdPhi){
			h_CutFlow_bstar->Fill(13.5);
			h_CutFlowWt_bstar->Fill(13.5, PreBTag_EvtWt);
			h_CutFlowTotalWt_bstar->Fill(13.5, PreBTag_EvtWt);

			if(Pass_GJdEta){
			  h_CutFlow_bstar->Fill(14.5);
			  h_CutFlowWt_bstar->Fill(14.5, PreBTag_EvtWt);
			  h_CutFlowTotalWt_bstar->Fill(14.5, PreBTag_EvtWt);

			  //----------------------------------------------------------
			  //[5]
			  //Photon distributions 0BTag_noMasscut
			  h_PhotonPt[5]               ->Fill((*phoEt)[PC], PreBTag_EvtWt);
			  h_PhotonCalibPt[5]          ->Fill((*phoCalibEt)[PC], PreBTag_EvtWt);
			  h_PhotonEta[5]              ->Fill((*phoSCEta)[PC], PreBTag_EvtWt);
			  h_PhotonPhi[5]              ->Fill((*phoSCPhi)[PC], PreBTag_EvtWt);
			  h_Photon_SigmaIEtaIEta[5]   ->Fill((*phoSigmaIEtaIEtaFull5x5)[PC], PreBTag_EvtWt);
			  h_Photon_R9[5]              ->Fill((*phoR9)[PC], PreBTag_EvtWt);
			  h_Photon_HoverE[5]          ->Fill((*phoHoverE)[PC], PreBTag_EvtWt);
			  h_Photon_EleVeto[5]         ->Fill((*phoEleVeto)[PC], PreBTag_EvtWt);
			  h_Photon_CorrPFChIso[5]     ->Fill(TMath::Max(((*phoPFChIso)[PC] - rho*EAChargedHadrons((*phoSCEta)[PC])), 0.0), PreBTag_EvtWt);
			  h_Photon_CorrPFNeuIso[5]    ->Fill(TMath::Max(((*phoPFNeuIso)[PC] - rho*EANeutralHadrons((*phoSCEta)[PC])), 0.0), PreBTag_EvtWt);
			  h_Photon_CorrPFPhoIso[5]    ->Fill(TMath::Max(((*phoPFPhoIso)[PC] - rho*EAPhotons((*phoSCEta)[PC])), 0.0), PreBTag_EvtWt);
		      
			  //Jet distributions 0BTag_noMasscut  
			  h_bJetPt[5]                 ->Fill((*jetPt)[JC], PreBTag_EvtWt);
			  h_bJetEta[5]                ->Fill((*jetEta)[JC], PreBTag_EvtWt);
			  h_bJetPhi[5]                ->Fill((*jetPhi)[JC], PreBTag_EvtWt);
			  h_bJet_Mt[5]                ->Fill((*jetMt)[JC], PreBTag_EvtWt);
			  h_bJet_area[5]              ->Fill((*jetArea)[JC], PreBTag_EvtWt);
			  h_bJet_Mass[5]              ->Fill((*jetMass)[JC], PreBTag_EvtWt);
			  h_bJet_NHEF[5]              ->Fill((*jetNHF)[JC], PreBTag_EvtWt);
			  h_bJet_NEEF[5]              ->Fill((*jetNEF)[JC], PreBTag_EvtWt);
			  h_bJet_NConst[5]            ->Fill((*jetNConstituents)[JC], PreBTag_EvtWt);
			  h_bJet_CHEF[5]              ->Fill((*jetCHF)[JC], PreBTag_EvtWt);
			  h_bJet_ChMult[5]            ->Fill((*jetNCH)[JC], PreBTag_EvtWt);
			  h_bJet_CEEF[5]              ->Fill((*jetCEF)[JC], PreBTag_EvtWt);
			  h_bJet_MUF[5]               ->Fill((*jetMUF)[JC], PreBTag_EvtWt);
			  h_bJet_NNP[5]               ->Fill((*jetNNP)[JC], PreBTag_EvtWt);
		      
			  //Photon+Jet distributions 0BTag_noMasscut 
			  h_GbJetInvtMass_VarBin[5]   ->Fill(GetInvtMass(PC, JC), PreBTag_EvtWt);
			  h_GbJetInvtMass_UnitBin[5]  ->Fill(GetInvtMass(PC, JC), PreBTag_EvtWt);
			  h_GbJet_dEta[5]             ->Fill(GetdEta((*phoSCEta)[PC], (*jetEta)[JC]), PreBTag_EvtWt);
			  h_GbJet_dPhi[5]             ->Fill(GetdPhi((*phoSCPhi)[PC], (*jetPhi)[JC]), PreBTag_EvtWt);
			  h_GbJet_dR[5]               ->Fill(GetdR((*phoSCEta)[PC], (*jetEta)[JC], (*phoSCPhi)[PC], (*jetPhi)[JC]), PreBTag_EvtWt);
			  h_cosThetaStar[5]           ->Fill(GetCosThetaStar((*phoSCEta)[PC], (*jetEta)[JC]), PreBTag_EvtWt);
		      
			  //PFMet distributions for 0BTag_noMasscut 
			  h_PFMet[5]                  ->Fill(pfMET, PreBTag_EvtWt);
			  h_SumPFMet[5]               ->Fill(pfMETsumEt, PreBTag_EvtWt);
			  h_MetBySumMET[5]            ->Fill(pfMET/pfMETsumEt, PreBTag_EvtWt);
			  h_PFMetVsGJmass[5]          ->Fill(GetInvtMass(PC, JC), pfMET, PreBTag_EvtWt);
			  h_PFMetOverSumEtVsGJmass[5] ->Fill(GetInvtMass(PC, JC), pfMET/pfMETsumEt, PreBTag_EvtWt);
			  h_MetByPhPt[5]              ->Fill(pfMET/(*phoEt)[PC], PreBTag_EvtWt);   

			  //Photon vs Jet dist for 0BTag_noMasscut 
			  h_PhPt_vs_bJetPt[5]         ->Fill((*phoEt)[PC], (*jetPt)[JC], PreBTag_EvtWt);
			  h_PhEta_vs_bJetEta[5]       ->Fill((*phoSCEta)[PC], (*jetEta)[JC], PreBTag_EvtWt);
		      
			  //CSVv2 discriminator distributions for 0BTag_noMasscut 
			  h_CSVv2Dist[5]              ->Fill((*jetCSV2BJetTags)[JC], PreBTag_EvtWt);
			  h_CSVv2_vs_bJetPt[5]        ->Fill((*jetPt)[JC], (*jetCSV2BJetTags)[JC], PreBTag_EvtWt);
			  h_CSVv2_vs_bJetEta[5]       ->Fill((*jetEta)[JC], (*jetCSV2BJetTags)[JC], PreBTag_EvtWt);

			  //Primary vertex and number of photon and jets for 0BTag_noMasscut 
			  h_goodPV_TotalWt[5]              ->Fill(GoodVertex, PreBTag_EvtWt);
			  h_nIsoPhotons[5]                 ->Fill(GoodIsoPhotons.size(), PreBTag_EvtWt);  // Tot # of isolated photons
			  h_nGoodPhotons[5]                ->Fill(GoodIsoBarrelPhotons.size(), PreBTag_EvtWt); // Tot # of isolated photons with pt > cut and eta < cut 
			  for(int ip = 0; ip < GoodIsoPhotons.size(); ip++){
			    h_IsoPhotonIdxVsPt[5]          ->Fill((*phoEt)[GoodIsoPhotons[ip]], ip+1, PreBTag_EvtWt);
			  }
			  for(int ii = 0; ii < GoodIsoBarrelPhotons.size(); ii++){
			    h_GoodPhotonIdxVsPt[5]         ->Fill((*phoEt)[GoodIsoBarrelPhotons[ii]], ii+1, PreBTag_EvtWt);
			  }				    
			  h_nJets[5]                       ->Fill(GoodIsoJets.size(), PreBTag_EvtWt);
			  for(int ij = 0; ij < GoodIsoJets.size(); ij++){
			    h_JetIdxVsPt[5]                ->Fill((*jetPt)[GoodIsoJets[ij]], ij+1, PreBTag_EvtWt);
			  }
			  //------------------------------------------------------------

			  if(Pass_GJInvtMass){
			    h_CutFlow_bstar->Fill(15.5);
			    h_CutFlowWt_bstar->Fill(15.5, PreBTag_EvtWt);
			    h_CutFlowTotalWt_bstar->Fill(15.5, PreBTag_EvtWt);

			    //----------------------------------------------------------
			    //[6]
			    //Photon distributions 0BTag_Masscut
			    h_PhotonPt[6]               ->Fill((*phoEt)[PC], PreBTag_EvtWt);
			    h_PhotonCalibPt[6]          ->Fill((*phoCalibEt)[PC], PreBTag_EvtWt);
			    h_PhotonEta[6]              ->Fill((*phoSCEta)[PC], PreBTag_EvtWt);
			    h_PhotonPhi[6]              ->Fill((*phoSCPhi)[PC], PreBTag_EvtWt);
			    h_Photon_SigmaIEtaIEta[6]   ->Fill((*phoSigmaIEtaIEtaFull5x5)[PC], PreBTag_EvtWt);
			    h_Photon_R9[6]              ->Fill((*phoR9)[PC], PreBTag_EvtWt);
			    h_Photon_HoverE[6]          ->Fill((*phoHoverE)[PC], PreBTag_EvtWt);
			    h_Photon_EleVeto[6]         ->Fill((*phoEleVeto)[PC], PreBTag_EvtWt);
			    h_Photon_CorrPFChIso[6]     ->Fill(TMath::Max(((*phoPFChIso)[PC] - rho*EAChargedHadrons((*phoSCEta)[PC])), 0.0), PreBTag_EvtWt);
			    h_Photon_CorrPFNeuIso[6]    ->Fill(TMath::Max(((*phoPFNeuIso)[PC] - rho*EANeutralHadrons((*phoSCEta)[PC])), 0.0), PreBTag_EvtWt);
			    h_Photon_CorrPFPhoIso[6]    ->Fill(TMath::Max(((*phoPFPhoIso)[PC] - rho*EAPhotons((*phoSCEta)[PC])), 0.0), PreBTag_EvtWt);
		      
			    //Jet distributions 0BTag_Masscut  
			    h_bJetPt[6]                 ->Fill((*jetPt)[JC], PreBTag_EvtWt);
			    h_bJetEta[6]                ->Fill((*jetEta)[JC], PreBTag_EvtWt);
			    h_bJetPhi[6]                ->Fill((*jetPhi)[JC], PreBTag_EvtWt);
			    h_bJet_Mt[6]                ->Fill((*jetMt)[JC], PreBTag_EvtWt);
			    h_bJet_area[6]              ->Fill((*jetArea)[JC], PreBTag_EvtWt);
			    h_bJet_Mass[6]              ->Fill((*jetMass)[JC], PreBTag_EvtWt);
			    h_bJet_NHEF[6]              ->Fill((*jetNHF)[JC], PreBTag_EvtWt);
			    h_bJet_NEEF[6]              ->Fill((*jetNEF)[JC], PreBTag_EvtWt);
			    h_bJet_NConst[6]            ->Fill((*jetNConstituents)[JC], PreBTag_EvtWt);
			    h_bJet_CHEF[6]              ->Fill((*jetCHF)[JC], PreBTag_EvtWt);
			    h_bJet_ChMult[6]            ->Fill((*jetNCH)[JC], PreBTag_EvtWt);
			    h_bJet_CEEF[6]              ->Fill((*jetCEF)[JC], PreBTag_EvtWt);
			    h_bJet_MUF[6]               ->Fill((*jetMUF)[JC], PreBTag_EvtWt);
			    h_bJet_NNP[6]               ->Fill((*jetNNP)[JC], PreBTag_EvtWt);
		      
			    //Photon+Jet distributions 0BTag_Masscut 
			    h_GbJetInvtMass_VarBin[6]   ->Fill(GetInvtMass(PC, JC), PreBTag_EvtWt);
			    h_GbJetInvtMass_UnitBin[6]  ->Fill(GetInvtMass(PC, JC), PreBTag_EvtWt);
			    h_GbJet_dEta[6]             ->Fill(GetdEta((*phoSCEta)[PC], (*jetEta)[JC]), PreBTag_EvtWt);
			    h_GbJet_dPhi[6]             ->Fill(GetdPhi((*phoSCPhi)[PC], (*jetPhi)[JC]), PreBTag_EvtWt);
			    h_GbJet_dR[6]               ->Fill(GetdR((*phoSCEta)[PC], (*jetEta)[JC], (*phoSCPhi)[PC], (*jetPhi)[JC]), PreBTag_EvtWt);
			    h_cosThetaStar[6]           ->Fill(GetCosThetaStar((*phoSCEta)[PC], (*jetEta)[JC]), PreBTag_EvtWt);
		      
			    //PFMet distributions for 0BTag_Masscut 
			    h_PFMet[6]                  ->Fill(pfMET, PreBTag_EvtWt);
			    h_SumPFMet[6]               ->Fill(pfMETsumEt, PreBTag_EvtWt);
			    h_MetBySumMET[6]            ->Fill(pfMET/pfMETsumEt, PreBTag_EvtWt);
			    h_PFMetVsGJmass[6]          ->Fill(GetInvtMass(PC, JC), pfMET, PreBTag_EvtWt);
			    h_PFMetOverSumEtVsGJmass[6] ->Fill(GetInvtMass(PC, JC), pfMET/pfMETsumEt, PreBTag_EvtWt);
			    h_MetByPhPt[6]              ->Fill(pfMET/(*phoEt)[PC], PreBTag_EvtWt);   

			    //Photon vs Jet dist for 0BTag_Masscut 
			    h_PhPt_vs_bJetPt[6]         ->Fill((*phoEt)[PC], (*jetPt)[JC], PreBTag_EvtWt);
			    h_PhEta_vs_bJetEta[6]       ->Fill((*phoSCEta)[PC], (*jetEta)[JC], PreBTag_EvtWt);
		      
			    //CSVv2 discriminator distributions for 0BTag_Masscut 
			    h_CSVv2Dist[6]              ->Fill((*jetCSV2BJetTags)[JC], PreBTag_EvtWt);
			    h_CSVv2_vs_bJetPt[6]        ->Fill((*jetPt)[JC], (*jetCSV2BJetTags)[JC], PreBTag_EvtWt);
			    h_CSVv2_vs_bJetEta[6]       ->Fill((*jetEta)[JC], (*jetCSV2BJetTags)[JC], PreBTag_EvtWt);

			    //Primary vertex and number of photon and jets for 0BTag_Masscut 
			    h_goodPV_TotalWt[6]              ->Fill(GoodVertex, PreBTag_EvtWt);
			    h_nIsoPhotons[6]                 ->Fill(GoodIsoPhotons.size(), PreBTag_EvtWt);  // Tot # of isolated photons
			    h_nGoodPhotons[6]                ->Fill(GoodIsoBarrelPhotons.size(), PreBTag_EvtWt); // Tot # of isolated photons with pt > cut and eta < cut 
			    for(int ip = 0; ip < GoodIsoPhotons.size(); ip++){
			      h_IsoPhotonIdxVsPt[6]          ->Fill((*phoEt)[GoodIsoPhotons[ip]], ip+1, PreBTag_EvtWt);
			    }
			    for(int ii = 0; ii < GoodIsoBarrelPhotons.size(); ii++){
			      h_GoodPhotonIdxVsPt[6]         ->Fill((*phoEt)[GoodIsoBarrelPhotons[ii]], ii+1, PreBTag_EvtWt);
			    }				    
			    h_nJets[6]                       ->Fill(GoodIsoJets.size(), PreBTag_EvtWt);
			    for(int ij = 0; ij < GoodIsoJets.size(); ij++){
			      h_JetIdxVsPt[6]                ->Fill((*jetPt)[GoodIsoJets[ij]], ij+1, PreBTag_EvtWt);
			    }
			    //-----------------------------------------------------------

			  }//if(Pass_GJInvtMass) inside else(Pass_CSVv2bTag)
			}//if(Pass_GJdEta) inside else(Pass_CSVv2bTag)
		      }//if(Pass_GJdPhi) inside else(Pass_CSVv2bTag)
		    }//else(Pass_CSVv2bTag)
		  }//Pass_JetEta
		}//Pass_JetPt
	      }//JC > -1
	    }//PC > -1
	  }//PhotonID
	}//HasPrimaryVtx
      }//Pass_HLT
      //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      /*
      //CSVv2 BTag Efficiencies
      vector<Int_t> goodjets;
      goodjets.clear();
      for(Int_t ii = 0; ii < nJet; ii++){
	if(JetId(ii, "tight")){
	  if(fabs((*jetEta)[ii]) < 2.4){
	    goodjets.push_back(ii);
	  }
	}
      }

      for(Int_t jj = 0; jj < goodjets.size(); jj++){
	Int_t Selectedjet = goodjets[jj];
	if(fabs((*jetHadFlvr)[Selectedjet]) == 5){
	  h_bEff_vs_pt[0]->Fill((*jetPt)[Selectedjet]);
	  h_bEff_vs_eta[0]->Fill((*jetEta)[Selectedjet]);
	}
	if(fabs((*jetHadFlvr)[Selectedjet]) == 4){
	  h_cEff_vs_pt[0]->Fill((*jetPt)[Selectedjet]);
	  h_cEff_vs_eta[0]->Fill((*jetEta)[Selectedjet]);
	}
	if(fabs((*jetHadFlvr)[Selectedjet]) == 0){
	  h_udsgEff_vs_pt[0]->Fill((*jetPt)[Selectedjet]);
	  h_udsgEff_vs_eta[0]->Fill((*jetEta)[Selectedjet]);
	}

	if(CSVv2bTag(Selectedjet, CSV_WP)){

	  Double_t SF_eff, Wt;
          BTagEntry::JetFlavor JF_eff;
	  std::string sys_type_eff = "central"; //central is required to get scale factors (up and down for uncertainties) 
	  if(fabs((*jetHadFlvr)[Selectedjet]) == 5) JF_eff = BTagEntry::FLAV_B; //b
	  if(fabs((*jetHadFlvr)[Selectedjet]) == 4) JF_eff = BTagEntry::FLAV_C; //c
	  if(fabs((*jetHadFlvr)[Selectedjet]) == 0) JF_eff = BTagEntry::FLAV_UDSG; //u,d,s,g,undefined

	  SF_eff = CSVv2bTagSF_auto(CSV_OP, JF_eff, sys_type_eff, (*jetPt)[Selectedjet], (*jetEta)[Selectedjet]);
		    
	  Wt = BTagEventWeight(SF_eff, 1); // SF		     
	  if(JF_eff == BTagEntry::FLAV_B){
	    h_bEff_vs_pt[1]->Fill((*jetPt)[Selectedjet]);
	    h_bEff_vs_pt[2]->Fill((*jetPt)[Selectedjet], Wt);
	    h_bEff_vs_eta[1]->Fill((*jetEta)[Selectedjet]);
	    h_bEff_vs_eta[2]->Fill((*jetEta)[Selectedjet], Wt);
	  }
	  if(JF_eff == BTagEntry::FLAV_C){
	    h_cEff_vs_pt[1]->Fill((*jetPt)[Selectedjet]);
	    h_cEff_vs_pt[2]->Fill((*jetPt)[Selectedjet], Wt);
	    h_cEff_vs_eta[1]->Fill((*jetEta)[Selectedjet]);
	    h_cEff_vs_eta[2]->Fill((*jetEta)[Selectedjet], Wt);
  	  }
	  if(JF_eff == BTagEntry::FLAV_UDSG){
	    h_udsgEff_vs_pt[1]->Fill((*jetPt)[Selectedjet]);
	    h_udsgEff_vs_pt[2]->Fill((*jetPt)[Selectedjet], Wt);
	    h_udsgEff_vs_eta[1]->Fill((*jetEta)[Selectedjet]);
	    h_udsgEff_vs_eta[2]->Fill((*jetEta)[Selectedjet], Wt);
	  }
	}
      }
      //---------------------------
      */
      //-----------------------------------------------------------------
      //CSVv2 BTag SF Errors
      if(Pass_HLT){
	if(HasPrimaryVtx){
	  if(GoodIsoPhotons.size() > 0){
	    if(PC > -1){
	      if(JC > -1){
		if(Pass_JetPt){
		  if(Pass_JetEta){
		    if(Pass_GJdPhi){
		      if(Pass_GJdEta){
			if(Pass_CSVv2bTag){

			  h_CutFlow_BTagSFerr->Fill(0.5);

			  Double_t SF, SFup, SFdown;
			  Double_t Wt_1Tag_SF, Wt_1Tag_SFup, Wt_1Tag_SFdown;
			  Double_t Wt_0Tag_SF, Wt_0Tag_SFup, Wt_0Tag_SFdown;
			  BTagEntry::JetFlavor JF;
			  std::string sys_type_c = "central"; 
			  std::string sys_type_u = "up"; 
			  std::string sys_type_d = "down"; 

			  if(fabs((*jetHadFlvr)[JC]) == 5) JF = BTagEntry::FLAV_B; //b
			  if(fabs((*jetHadFlvr)[JC]) == 4) JF = BTagEntry::FLAV_C; //c
			  if(fabs((*jetHadFlvr)[JC]) == 0) JF = BTagEntry::FLAV_UDSG; //u,d,s,g,undefined

			  SF = CSVv2bTagSF_auto(CSV_OP, JF, sys_type_c, (*jetPt)[JC], (*jetEta)[JC]);
			  SFup = CSVv2bTagSF_auto(CSV_OP, JF, sys_type_u, (*jetPt)[JC], (*jetEta)[JC]);
			  SFdown = CSVv2bTagSF_auto(CSV_OP, JF, sys_type_d, (*jetPt)[JC], (*jetEta)[JC]);

			  Wt_1Tag_SF = BTagEventWeight(SF, 1);
			  Wt_1Tag_SFup = BTagEventWeight(SFup, 1);
			  Wt_1Tag_SFdown = BTagEventWeight(SFdown, 1);
			  Wt_0Tag_SF = BTagEventWeight(SF, 0);
			  Wt_0Tag_SFup = BTagEventWeight(SFup, 0);
			  Wt_0Tag_SFdown = BTagEventWeight(SFdown, 0);

			  h_CutFlow_BTagSFerr->Fill(1.5, Wt_1Tag_SF);
			  h_CutFlow_BTagSFerr->Fill(2.5, Wt_1Tag_SFup);
			  h_CutFlow_BTagSFerr->Fill(3.5, Wt_1Tag_SFdown);

			  h_CutFlow_BTagSFerr->Fill(4.5, Wt_0Tag_SF);
			  h_CutFlow_BTagSFerr->Fill(5.5, Wt_0Tag_SFup);
			  h_CutFlow_BTagSFerr->Fill(6.5, Wt_0Tag_SFdown);

			  if(Pass_GJInvtMass){
			    h_CutFlow_BTagSFerr->Fill(7.5);

			    h_CutFlow_BTagSFerr->Fill(8.5, Wt_1Tag_SF);
			    h_CutFlow_BTagSFerr->Fill(9.5, Wt_1Tag_SFup);
			    h_CutFlow_BTagSFerr->Fill(10.5, Wt_1Tag_SFdown);

			    h_CutFlow_BTagSFerr->Fill(11.5, Wt_0Tag_SF);
			    h_CutFlow_BTagSFerr->Fill(12.5, Wt_0Tag_SFup);
			    h_CutFlow_BTagSFerr->Fill(13.5, Wt_0Tag_SFdown);
 
			  }
			} //if(Pass_CSVv2bTag)
		      }
		    }
		  }
		}
	      }
	    }
	  }
	}
      } //if(Pass_HLT)
      //-----------------------------------------------------------------

   }//for jentry

}//Loop()


EOF



cat >> PostAnalyzer_MC.h <<EOF 
//////////////////////////////////////////////////////////
// This class has been automatically generated on
// Fri Dec 11 01:52:07 2015 by ROOT version 6.02/05
// from TChain ggNtuplizer/EventTree/
//////////////////////////////////////////////////////////

#ifndef PostAnalyzer_MC_h
#define PostAnalyzer_MC_h

#include <TROOT.h>
#include <TChain.h>
#include <TFile.h>
#include <TMath.h>
#include <TTree.h>
#include <TBranch.h>
#include <TH1.h>
#include <TH2.h>
#include <TMinuit.h>
#include <TRandom.h>
#include <TString.h>
#include <TH1F.h>
#include <TH2F.h>
#include <TH1D.h>
#include <TH2D.h>
#include <TH1I.h>
#include <TLorentzVector.h>
#include <TSystemFile.h>
#include <TSystemDirectory.h>
#include <TDCacheFile.h>
#include <TCanvas.h>
#include <TLegend.h>
#include <TList.h>
#include <Riostream.h>
#include <TGraphAsymmErrors.h>
#include "TRFIOFile.h"
#include "TKDE.h" 

// Header file for the classes stored in the TTree if any.
#include "vector"

//c++ include files
#include <iostream>
#include <fstream>
#include <string>
#include <stdio.h>
#include <map>
#include <set>
#include <sstream>

//For b-tag SF
#include "/uscms_data/d3/rocky86/13TeV/PostAnalyzer_2015+2016/PostAnalyzer_80X/PostAnalyzer_MC/PA_Main/BtagSF/BTagCalibrationStandalone.h"

using namespace std;
using namespace ROOT;

class PostAnalyzer_MC {
public :
   TTree          *fChain;   //!pointer to the analyzed TTree or TChain
   Int_t           fCurrent; //!current Tree number in a TChain

   // Fixed size dimensions of array or collections stored in the TTree if any.
   //-----------------------
   //Variables defined by me
   //-----------------------
   //Outut root file
   TFile *file;

   //Bools
   Bool_t Pass_HLT;
   Bool_t HasPrimaryVtx;
   Bool_t Pass_PhoPt;
   Bool_t Pass_PhoEtaEB;
   Bool_t Pass_JetPt;
   Bool_t Pass_JetEta;
   Bool_t Pass_GJdPhi;
   Bool_t Pass_GJdEta;
   Bool_t Pass_GJInvtMass;
   Bool_t Pass_CSVv2bTag;

   //Ints, Doubles etc.
   Int_t GoodVertex;
   Int_t PC, JC;

   Double_t Cut_Vtx_z; //(cm)
   Double_t Cut_Vtx_ndof;
   Double_t Cut_Vtx_rho; //(cm)

   Double_t Cut_Photon_pt; //(GeV)
   Double_t Cut_Photon_eta;
   Double_t Cut_Jet_pt; //(GeV)
   Double_t Cut_Jet_eta;
   Double_t Cut_GJdPhi;
   Double_t Cut_GJdEta;
   Double_t Cut_GJInvtMass;
   TString Cut_PhId;
   TString Cut_JetId;

   //Only MC
   Double_t Lumi;
   Double_t Lumi_EvtWt, PU_EvtWt, PreBTag_EvtWt, Total_EvtWt_1tag, Total_EvtWt_0tag;

   //Photon and Jet Containers
   vector<Int_t> GoodIsoPhotons;
   vector<Int_t> GoodIsoBarrelPhotons;
   vector<Int_t> GoodIsoJets;

   //**************************************************************
   //Histograms
   TH1F *h_PhotonPt[7];
   TH1F *h_PhotonCalibPt[7];
   TH1F *h_PhotonEta[7];
   TH1F *h_PhotonPhi[7];
   TH1F *h_Photon_SigmaIEtaIEta[7];
   TH1F *h_Photon_R9[7];
   TH1F *h_Photon_HoverE[7];
   TH1F *h_Photon_EleVeto[7];
   TH1F *h_Photon_CorrPFChIso[7];
   TH1F *h_Photon_CorrPFNeuIso[7];
   TH1F *h_Photon_CorrPFPhoIso[7];

   TH1F *h_bJetPt[7];
   TH1F *h_bJetEta[7];
   TH1F *h_bJetPhi[7];
   TH1F *h_bJet_Mt[7];
   TH1F *h_bJet_area[7];
   TH1F *h_bJet_Mass[7];
   TH1F *h_bJet_NHEF[7]; //Neutral Hadron energy fraction
   TH1F *h_bJet_NEEF[7]; //Neutral EM energy fraction
   TH1F *h_bJet_NConst[7]; //Number of constituents
   TH1F *h_bJet_CHEF[7];  //Charged Hadron energy fraction
   TH1F *h_bJet_ChMult[7]; //Charged Multiplicity
   TH1F *h_bJet_CEEF[7]; //Charged EM energy fraction
   TH1F *h_bJet_MUF[7]; //Muon energy fraction
   TH1F *h_bJet_NNP[7]; //Number of neutral particles

   TH1F *h_GbJetInvtMass_VarBin[7];
   TH1F *h_GbJetInvtMass_UnitBin[7];
   TH1F *h_GbJet_dEta[7];
   TH1F *h_GbJet_dPhi[7];
   TH1F *h_GbJet_dR[7];
   TH1F *h_cosThetaStar[7];

   TH1F *h_PFMet[7];
   TH1F *h_SumPFMet[7];
   TH1F *h_MetBySumMET[7];
   TH2F *h_PFMetVsGJmass[7];
   TH2F *h_PFMetOverSumEtVsGJmass[7];
   TH1F *h_MetByPhPt[7];

   TH2F *h_BTagSF_vs_pt[3];
   TH2F *h_BTagSF_vs_eta[3];
   TH2F *h_BTagSFerr_vs_pt[3];
   TH2F *h_BTagSFerr_vs_eta[3];

   TH2F *h_PhPt_vs_bJetPt[7];
   TH2F *h_PhEta_vs_bJetEta[7];

   TH1F *h_CSVv2Dist[7];
   TH2F *h_CSVv2_vs_bJetPt[7];
   TH2F *h_CSVv2_vs_bJetEta[7];

   //Photon matchedGenPhoton-GenParton matching
   TH1F *h_matchedPromptGenPhoton_GenParton_dR[3];
   TH1F *h_matchedNonPromptGenPhoton_GenParton_dR[3];
   TH1F *h_matchedPromptGenPhoton_GenParton_dPToverPT[3];
   TH1F *h_matchedNonPromptGenPhoton_GenParton_dPToverPT[3];

   //Btag efficiency;
   TH1F *h_bEff_vs_pt[3];
   TH1F *h_cEff_vs_pt[3];
   TH1F *h_udsgEff_vs_pt[3];
   TH1F *h_bEff_vs_eta[3];
   TH1F *h_cEff_vs_eta[3];
   TH1F *h_udsgEff_vs_eta[3];

   //Evts Wts
   TH1F *h_PU_EvtWt;
   TH1F *h_PreBTag_EvtWt;
   TH1F *h_bTag_SF;
   TH1F *h_bTag_EvtWt_1Tag;
   TH1F *h_bTag_EvtWt_0Tag;

   //Pileup
   TH1F *h_trueNumofInt;
   TH1F *h_goodPV_noWt;
   TH1F *h_goodPV_LumiWt;
   TH1F *h_goodPV_PUWt;
   TH1F *h_goodPV_LumiWt_noMassCut;
   TH1F *h_goodPV_TotalWt[7];

   //Number of photons and jets
   TH1F *h_nIsoPhotons[7];
   TH1F *h_nGoodPhotons[7];
   TH2F *h_IsoPhotonIdxVsPt[7];
   TH2F *h_GoodPhotonIdxVsPt[7];
   TH1F *h_nJets[7];
   TH2F *h_JetIdxVsPt[7];

   TH1F *h_PC;
   TH1F *h_JC;

   //Cut Flow
   TH1F *h_CutFlow_qstar;
   TH1F *h_CutFlow_bstar;
   TH1F *h_CutFlowWt_qstar;
   TH1F *h_CutFlowWt_bstar;
   TH1F *h_CutFlowTotalWt_bstar;
   TH1F *h_CutFlow_BTagSFerr;

   //Pileup Reweighting
   TH1F *h_DataPUNormDist;
   TH1F *h_MCPUNormDist;
   TH1F *h_PUScaleFactor;

   //********************************************************************************

   //Variables of TTree::EventTree
   // Declaration of leaf types
   Int_t           run;
   Long64_t        event;
   Int_t           lumis;
   Bool_t          isData;
   Int_t           nVtx;
   Int_t           nGoodVtx;
   Int_t           nTrksPV;
   Bool_t          isPVGood;
   Float_t         vtx;
   Float_t         vty;
   Float_t         vtz;
   Float_t         rho;
   Float_t         rhoCentral;
   ULong64_t       HLTEleMuX;
   ULong64_t       HLTPho;
   ULong64_t       HLTJet;
   ULong64_t       HLTEleMuXIsPrescaled;
   ULong64_t       HLTPhoIsPrescaled;
   ULong64_t       HLTJetIsPrescaled;
   vector<int>     *phoPrescale;
   vector<float>   *pdf;
   Float_t         pthat;
   Float_t         processID;
   Float_t         genWeight;
   Float_t         genHT;
   TString         *EventTag;
   Int_t           nPUInfo;
   vector<int>     *nPU;
   vector<int>     *puBX;
   vector<float>   *puTrue; //getTrueNumofInteractions, Same for a BX(both in and out of time), so this vector has all the values same for an event.
   Int_t           nMC;
   vector<int>     *mcPID;
   vector<float>   *mcVtx;
   vector<float>   *mcVty;
   vector<float>   *mcVtz;
   vector<float>   *mcPt;
   vector<float>   *mcMass;
   vector<float>   *mcEta;
   vector<float>   *mcPhi;
   vector<float>   *mcE;
   vector<float>   *mcEt;
   vector<int>     *mcGMomPID;
   vector<int>     *mcMomPID;
   vector<float>   *mcMomPt;
   vector<float>   *mcMomMass;
   vector<float>   *mcMomEta;
   vector<float>   *mcMomPhi;
   vector<int>     *mcIndex;
   vector<unsigned short> *mcStatusFlag;
   vector<int>     *mcParentage;
   vector<int>     *mcStatus;
   vector<float>   *mcCalIsoDR03;
   vector<float>   *mcTrkIsoDR03;
   vector<float>   *mcCalIsoDR04;
   vector<float>   *mcTrkIsoDR04;
   Float_t         genMET;
   Float_t         genMETPhi;
   Int_t           metFilters;
   Float_t         pfMET;
   Float_t         pfMETPhi;
   Float_t         pfMETsumEt;
   Float_t         pfMETmEtSig;
   Float_t         pfMETSig;
   Float_t         pfMET_T1JERUp;
   Float_t         pfMET_T1JERDo;
   Float_t         pfMET_T1JESUp;
   Float_t         pfMET_T1JESDo;
   Float_t         pfMET_T1UESUp;
   Float_t         pfMET_T1UESDo;
   Float_t         pfMETPhi_T1JESUp;
   Float_t         pfMETPhi_T1JESDo;
   Float_t         pfMETPhi_T1UESUp;
   Float_t         pfMETPhi_T1UESDo;
   Int_t           nPho;
   vector<float>   *phoE;
   vector<float>   *phoEt;
   vector<float>   *phoEta;
   vector<float>   *phoPhi;
   vector<float>   *phoPx;
   vector<float>   *phoPy;
   vector<float>   *phoPz;
   vector<float>   *phoCalibE;
   vector<float>   *phoCalibEt;
   vector<float>   *phoSCE;
   vector<float>   *phoSCRawE;
   vector<float>   *phoESEn;
   vector<float>   *phoESEnP1;
   vector<float>   *phoESEnP2;
   vector<float>   *phoSCEta;
   vector<float>   *phoSCPhi;
   vector<float>   *phoSCEtaWidth;
   vector<float>   *phoSCPhiWidth;
   vector<float>   *phoSCBrem;
   vector<int>     *phohasPixelSeed;
   vector<int>     *phoEleVeto;
   vector<float>   *phoR9;
   vector<float>   *phoHoverE;
   vector<float>   *phoE1x3;
   vector<float>   *phoE1x5;
   vector<float>   *phoE2x2;
   vector<float>   *phoE2x5Max;
   vector<float>   *phoE5x5;
   vector<float>   *phoESEffSigmaRR;
   vector<float>   *phomaxXtalenergyFull5x5;
   vector<float>   *phoSigmaIEtaIEtaFull5x5;
   vector<float>   *phoSigmaIEtaIPhiFull5x5;
   vector<float>   *phoSigmaIPhiIPhiFull5x5;
   vector<float>   *phoE1x3Full5x5;
   vector<float>   *phoE1x5Full5x5;
   vector<float>   *phoE2x2Full5x5;
   vector<float>   *phoE2x5MaxFull5x5;
   vector<float>   *phoE5x5Full5x5;
   vector<float>   *phoR9Full5x5;
   vector<float>   *phoSeedBCE;
   vector<float>   *phoSeedBCEta;
   vector<float>   *phoPFChIso;
   vector<float>   *phoPFPhoIso;
   vector<float>   *phoPFNeuIso;
   vector<float>   *phoPFChWorstIso;
   vector<float>   *phoCITKChIso;
   vector<float>   *phoCITKPhoIso;
   vector<float>   *phoCITKNeuIso;
   vector<float>   *phoIDMVA;
   vector<unsigned int> *phoFiredSingleTrgs;
   vector<unsigned int> *phoFiredDoubleTrgs;
   vector<unsigned int> *phoFiredL1Trgs;
   vector<float>   *phoSeedTime;
   vector<float>   *phoSeedEnergy;
   vector<double>  *phoScaleCorrUnc;
   vector<double>  *phoSmearUnc_nominal;
   vector<double>  *phoSmearUnc_rhoUp;
   vector<double>  *phoSmearUnc_rhoDown;
   vector<double>  *phoSmearUnc_phiUp;
   vector<double>  *phoSmearUnc_phiDown;
   vector<unsigned short> *phoxtalBits;
   vector<unsigned short> *phoIDbit;
   Int_t           npfPho;
   vector<float>   *pfphoEt;
   vector<float>   *pfphoEta;
   vector<float>   *pfphoPhi;
   Int_t           nEle;
   vector<int>     *eleCharge;
   vector<int>     *eleChargeConsistent;
   vector<float>   *eleEn;
   vector<float>   *eleSCEn;
   vector<float>   *eleESEn;
   vector<float>   *eleESEnP1;
   vector<float>   *eleESEnP2;
   vector<float>   *eleD0;
   vector<float>   *eleDz;
   vector<float>   *eleSIP;
   vector<float>   *elePt;
   vector<float>   *eleEta;
   vector<float>   *elePhi;
   vector<float>   *eleR9;
   vector<float>   *eleCalibPt;
   vector<float>   *eleCalibEn;
   vector<float>   *eleScaleSyst;
   vector<float>   *eleSmearRhoUp;
   vector<float>   *eleSmearRhoDo;
   vector<float>   *eleSmearPhiUp;
   vector<float>   *eleSmearPhiDo;
   vector<float>   *eleSCEta;
   vector<float>   *eleSCPhi;
   vector<float>   *eleSCRawEn;
   vector<float>   *eleSCEtaWidth;
   vector<float>   *eleSCPhiWidth;
   vector<float>   *eleHoverE;
   vector<float>   *eleEoverP;
   vector<float>   *eleEoverPout;
   vector<float>   *eleEoverPInv;
   vector<float>   *eleBrem;
   vector<float>   *eledEtaAtVtx;
   vector<float>   *eledPhiAtVtx;
   vector<float>   *eledEtaAtCalo;
   vector<float>   *eleSigmaIEtaIEtaFull5x5;
   vector<float>   *eleSigmaIPhiIPhiFull5x5;
   vector<int>     *eleConvVeto;
   vector<int>     *eleMissHits;
   vector<float>   *eleESEffSigmaRR;
   vector<float>   *elePFChIso;
   vector<float>   *elePFPhoIso;
   vector<float>   *elePFNeuIso;
   vector<float>   *elePFPUIso;
   vector<float>   *elePFClusEcalIso;
   vector<float>   *elePFClusHcalIso;
   vector<float>   *elePFMiniIso;
   vector<float>   *eleIDMVA;
   vector<float>   *eleIDMVAHZZ;
   vector<float>   *eledEtaseedAtVtx;
   vector<float>   *eleE1x5;
   vector<float>   *eleE2x5;
   vector<float>   *eleE5x5;
   vector<float>   *eleE1x5Full5x5;
   vector<float>   *eleE2x5Full5x5;
   vector<float>   *eleE5x5Full5x5;
   vector<float>   *eleR9Full5x5;
   vector<int>     *eleEcalDrivenSeed;
   vector<float>   *eleDr03EcalRecHitSumEt;
   vector<float>   *eleDr03HcalDepth1TowerSumEt;
   vector<float>   *eleDr03HcalDepth2TowerSumEt;
   vector<float>   *eleDr03HcalTowerSumEt;
   vector<float>   *eleDr03TkSumPt;
   vector<float>   *elecaloEnergy;
   vector<float>   *eleTrkdxy;
   vector<float>   *eleKFHits;
   vector<float>   *eleKFChi2;
   vector<float>   *eleGSFChi2;
   vector<vector<float> > *eleGSFPt;
   vector<vector<float> > *eleGSFEta;
   vector<vector<float> > *eleGSFPhi;
   vector<vector<float> > *eleGSFCharge;
   vector<vector<int> > *eleGSFHits;
   vector<vector<int> > *eleGSFMissHits;
   vector<vector<int> > *eleGSFNHitsMax;
   vector<vector<float> > *eleGSFVtxProb;
   vector<vector<float> > *eleGSFlxyPV;
   vector<vector<float> > *eleGSFlxyBS;
   vector<vector<float> > *eleBCEn;
   vector<vector<float> > *eleBCEta;
   vector<vector<float> > *eleBCPhi;
   vector<vector<float> > *eleBCS25;
   vector<vector<float> > *eleBCS15;
   vector<vector<float> > *eleBCSieie;
   vector<vector<float> > *eleBCSieip;
   vector<vector<float> > *eleBCSipip;
   vector<unsigned int> *eleFiredSingleTrgs;
   vector<unsigned int> *eleFiredDoubleTrgs;
   vector<unsigned int> *eleFiredL1Trgs;
   vector<unsigned short> *eleIDbit;
   Int_t           npfHF;
   vector<float>   *pfHFEn;
   vector<float>   *pfHFECALEn;
   vector<float>   *pfHFHCALEn;
   vector<float>   *pfHFPt;
   vector<float>   *pfHFEta;
   vector<float>   *pfHFPhi;
   vector<float>   *pfHFIso;
   Int_t           nMu;
   vector<float>   *muPt;
   vector<float>   *muEn;
   vector<float>   *muEta;
   vector<float>   *muPhi;
   vector<int>     *muCharge;
   vector<int>     *muType;
   vector<unsigned short> *muIDbit;
   vector<float>   *muD0;
   vector<float>   *muDz;
   vector<float>   *muSIP;
   vector<float>   *muChi2NDF;
   vector<float>   *muInnerD0;
   vector<float>   *muInnerDz;
   vector<int>     *muTrkLayers;
   vector<int>     *muPixelLayers;
   vector<int>     *muPixelHits;
   vector<int>     *muMuonHits;
   vector<int>     *muStations;
   vector<int>     *muMatches;
   vector<int>     *muTrkQuality;
   vector<float>   *muIsoTrk;
   vector<float>   *muPFChIso;
   vector<float>   *muPFPhoIso;
   vector<float>   *muPFNeuIso;
   vector<float>   *muPFPUIso;
   vector<float>   *muPFMiniIso;
   vector<unsigned int> *muFiredTrgs;
   vector<unsigned int> *muFiredL1Trgs;
   vector<float>   *muInnervalidFraction;
   vector<float>   *musegmentCompatibility;
   vector<float>   *muchi2LocalPosition;
   vector<float>   *mutrkKink;
   vector<float>   *muBestTrkPtError;
   vector<float>   *muBestTrkPt;
   Int_t           nJet;
   vector<float>   *jetPt;
   vector<float>   *jetEn;
   vector<float>   *jetEta;
   vector<float>   *jetPhi;
   vector<float>   *jetRawPt;
   vector<float>   *jetRawEn;
   vector<float>   *jetMt;
   vector<float>   *jetArea;
   vector<float>   *jetMass;
   vector<float>   *jetPx;
   vector<float>   *jetPy;
   vector<float>   *jetPz;
   vector<float>   *jetLeadTrackPt;
   vector<float>   *jetLeadTrackEta;
   vector<float>   *jetLeadTrackPhi;
   vector<int>     *jetLepTrackPID;
   vector<float>   *jetLepTrackPt;
   vector<float>   *jetLepTrackEta;
   vector<float>   *jetLepTrackPhi;
   vector<float>   *jetCSV2BJetTags;
   vector<float>   *jetJetProbabilityBJetTags;
   vector<float>   *jetpfCombinedMVAV2BJetTags;
   vector<int>     *jetPartonID;
   vector<int>     *jetHadFlvr;
   vector<float>   *jetGenJetEn;
   vector<float>   *jetGenJetPt;
   vector<float>   *jetGenJetEta;
   vector<float>   *jetGenJetPhi;
   vector<int>     *jetGenPartonID;
   vector<float>   *jetGenEn;
   vector<float>   *jetGenPt;
   vector<float>   *jetGenEta;
   vector<float>   *jetGenPhi;
   vector<int>     *jetGenPartonMomID;
   vector<float>   *jetP4Smear;
   vector<float>   *jetP4SmearUp;
   vector<float>   *jetP4SmearDo;
   vector<bool>    *jetPFLooseId;
   vector<int>     *jetID;
   vector<float>   *jetPUID;
   vector<float>   *jetJECUnc;
   vector<float>   *jetJERSmearing;
   vector<float>   *jetJERSmearingUp;
   vector<float>   *jetJERSmearingDown;
   vector<unsigned int> *jetFiredTrgs;
   vector<float>   *jetCHF;
   vector<float>   *jetNHF;
   vector<float>   *jetCEF;
   vector<float>   *jetNEF;
   vector<int>     *jetNCH;
   vector<int>     *jetNNP;
   vector<float>   *jetMUF;
   vector<float>   *jetVtxPt;
   vector<float>   *jetVtxMass;
   vector<float>   *jetVtxNtrks;
   vector<float>   *jetVtx3DVal;
   vector<float>   *jetVtx3DSig;
   vector<float>   *jetHFHAE;
   vector<float>   *jetHFEME;
   vector<int>     *jetNConstituents;
   Int_t           nAK8Jet;
   vector<float>   *AK8JetPt;
   vector<float>   *AK8JetEn;
   vector<float>   *AK8JetRawPt;
   vector<float>   *AK8JetRawEn;
   vector<float>   *AK8JetEta;
   vector<float>   *AK8JetPhi;
   vector<float>   *AK8JetMass;
   vector<float>   *AK8Jet_tau1;
   vector<float>   *AK8Jet_tau2;
   vector<float>   *AK8Jet_tau3;
   vector<float>   *AK8JetCHF;
   vector<float>   *AK8JetNHF;
   vector<float>   *AK8JetCEF;
   vector<float>   *AK8JetNEF;
   vector<int>     *AK8JetNCH;
   vector<int>     *AK8JetNNP;
   vector<float>   *AK8JetMUF;
   vector<int>     *AK8Jetnconstituents;
   vector<bool>    *AK8JetPFLooseId;
   vector<bool>    *AK8JetPFTightLepVetoId;
   vector<float>   *AK8JetSoftDropMass;
   vector<float>   *AK8JetSoftDropMassCorr;
   vector<float>   *AK8JetPrunedMass;
   vector<float>   *AK8JetPrunedMassCorr;
   vector<float>   *AK8JetpfBoostedDSVBTag;
   vector<float>   *AK8JetDSVnewV4;
   vector<float>   *AK8JetCSV;
   vector<float>   *AK8JetJECUnc;
   vector<float>   *AK8JetL2L3corr;
   vector<float>   *AK8puppiPt;
   vector<float>   *AK8puppiMass;
   vector<float>   *AK8puppiEta;
   vector<float>   *AK8puppiPhi;
   vector<float>   *AK8puppiTau1;
   vector<float>   *AK8puppiTau2;
   vector<float>   *AK8puppiTau3;
   vector<float>   *AK8puppiSDL2L3corr;
   vector<float>   *AK8puppiSDMass;
   vector<float>   *AK8puppiSDMassL2L3Corr;
   vector<int>     *AK8JetPartonID;
   vector<int>     *AK8JetHadFlvr;
   vector<int>     *AK8JetGenJetIndex;
   vector<float>   *AK8JetGenJetEn;
   vector<float>   *AK8JetGenJetPt;
   vector<float>   *AK8JetGenJetEta;
   vector<float>   *AK8JetGenJetPhi;
   vector<int>     *AK8JetGenPartonID;
   vector<float>   *AK8JetGenEn;
   vector<float>   *AK8JetGenPt;
   vector<float>   *AK8JetGenEta;
   vector<float>   *AK8JetGenPhi;
   vector<int>     *AK8JetGenPartonMomID;
   vector<float>   *AK8JetP4Smear;
   vector<float>   *AK8JetP4SmearUp;
   vector<float>   *AK8JetP4SmearDo;
   vector<int>     *nAK8SDSJ;
   vector<vector<float> > *AK8SDSJPt;
   vector<vector<float> > *AK8SDSJEta;
   vector<vector<float> > *AK8SDSJPhi;
   vector<vector<float> > *AK8SDSJMass;
   vector<vector<float> > *AK8SDSJE;
   vector<vector<int> > *AK8SDSJCharge;
   vector<vector<int> > *AK8SDSJFlavour;
   vector<vector<float> > *AK8SDSJCSV;
   vector<int>     *nAK8puppiSDSJ;
   vector<vector<float> > *AK8puppiSDSJPt;
   vector<vector<float> > *AK8puppiSDSJEta;
   vector<vector<float> > *AK8puppiSDSJPhi;
   vector<vector<float> > *AK8puppiSDSJMass;
   vector<vector<float> > *AK8puppiSDSJE;
   vector<vector<int> > *AK8puppiSDSJCharge;
   vector<vector<int> > *AK8puppiSDSJFlavour;
   vector<vector<float> > *AK8puppiSDSJCSV;

   // List of branches
   TBranch        *b_run;   //!
   TBranch        *b_event;   //!
   TBranch        *b_lumis;   //!
   TBranch        *b_isData;   //!
   TBranch        *b_nVtx;   //!
   TBranch        *b_nGoodVtx;   //!
   TBranch        *b_nTrksPV;   //!
   TBranch        *b_isPVGood;   //!
   TBranch        *b_vtx;   //!
   TBranch        *b_vty;   //!
   TBranch        *b_vtz;   //!
   TBranch        *b_rho;   //!
   TBranch        *b_rhoCentral;   //!
   TBranch        *b_HLTEleMuX;   //!
   TBranch        *b_HLTPho;   //!
   TBranch        *b_HLTJet;   //!
   TBranch        *b_HLTEleMuXIsPrescaled;   //!
   TBranch        *b_HLTPhoIsPrescaled;   //!
   TBranch        *b_HLTJetIsPrescaled;   //!
   TBranch        *b_phoPrescale;   //!
   TBranch        *b_pdf;   //!
   TBranch        *b_pthat;   //!
   TBranch        *b_processID;   //!
   TBranch        *b_genWeight;   //!
   TBranch        *b_genHT;   //!
   TBranch        *b_EventTag;   //!
   TBranch        *b_nPUInfo;   //!
   TBranch        *b_nPU;   //!
   TBranch        *b_puBX;   //!
   TBranch        *b_puTrue;   //!
   TBranch        *b_nMC;   //!
   TBranch        *b_mcPID;   //!
   TBranch        *b_mcVtx;   //!
   TBranch        *b_mcVty;   //!
   TBranch        *b_mcVtz;   //!
   TBranch        *b_mcPt;   //!
   TBranch        *b_mcMass;   //!
   TBranch        *b_mcEta;   //!
   TBranch        *b_mcPhi;   //!
   TBranch        *b_mcE;   //!
   TBranch        *b_mcEt;   //!
   TBranch        *b_mcGMomPID;   //!
   TBranch        *b_mcMomPID;   //!
   TBranch        *b_mcMomPt;   //!
   TBranch        *b_mcMomMass;   //!
   TBranch        *b_mcMomEta;   //!
   TBranch        *b_mcMomPhi;   //!
   TBranch        *b_mcIndex;   //!
   TBranch        *b_mcStatusFlag;   //!
   TBranch        *b_mcParentage;   //!
   TBranch        *b_mcStatus;   //!
   TBranch        *b_mcCalIsoDR03;   //!
   TBranch        *b_mcTrkIsoDR03;   //!
   TBranch        *b_mcCalIsoDR04;   //!
   TBranch        *b_mcTrkIsoDR04;   //!
   TBranch        *b_genMET;   //!
   TBranch        *b_genMETPhi;   //!
   TBranch        *b_metFilters;   //!
   TBranch        *b_pfMET;   //!
   TBranch        *b_pfMETPhi;   //!
   TBranch        *b_pfMETsumEt;   //!
   TBranch        *b_pfMETmEtSig;   //!
   TBranch        *b_pfMETSig;   //!
   TBranch        *b_pfMET_T1JERUp;   //!
   TBranch        *b_pfMET_T1JERDo;   //!
   TBranch        *b_pfMET_T1JESUp;   //!
   TBranch        *b_pfMET_T1JESDo;   //!
   TBranch        *b_pfMET_T1UESUp;   //!
   TBranch        *b_pfMET_T1UESDo;   //!
   TBranch        *b_pfMETPhi_T1JESUp;   //!
   TBranch        *b_pfMETPhi_T1JESDo;   //!
   TBranch        *b_pfMETPhi_T1UESUp;   //!
   TBranch        *b_pfMETPhi_T1UESDo;   //!
   TBranch        *b_nPho;   //!
   TBranch        *b_phoE;   //!
   TBranch        *b_phoEt;   //!
   TBranch        *b_phoEta;   //!
   TBranch        *b_phoPhi;   //!
   TBranch        *b_phoPx;   //!
   TBranch        *b_phoPy;   //!
   TBranch        *b_phoPz;   //!
   TBranch        *b_phoCalibE;   //!
   TBranch        *b_phoCalibEt;   //!
   TBranch        *b_phoSCE;   //!
   TBranch        *b_phoSCRawE;   //!
   TBranch        *b_phoESEn;   //!
   TBranch        *b_phoESEnP1;   //!
   TBranch        *b_phoESEnP2;   //!
   TBranch        *b_phoSCEta;   //!
   TBranch        *b_phoSCPhi;   //!
   TBranch        *b_phoSCEtaWidth;   //!
   TBranch        *b_phoSCPhiWidth;   //!
   TBranch        *b_phoSCBrem;   //!
   TBranch        *b_phohasPixelSeed;   //!
   TBranch        *b_phoEleVeto;   //!
   TBranch        *b_phoR9;   //!
   TBranch        *b_phoHoverE;   //!
   TBranch        *b_phoE1x3;   //!
   TBranch        *b_phoE1x5;   //!
   TBranch        *b_phoE2x2;   //!
   TBranch        *b_phoE2x5Max;   //!
   TBranch        *b_phoE5x5;   //!
   TBranch        *b_phoESEffSigmaRR;   //!
   TBranch        *b_phomaxXtalenergyFull5x5;   //!
   TBranch        *b_phoSigmaIEtaIEtaFull5x5;   //!
   TBranch        *b_phoSigmaIEtaIPhiFull5x5;   //!
   TBranch        *b_phoSigmaIPhiIPhiFull5x5;   //!
   TBranch        *b_phoE1x3Full5x5;   //!
   TBranch        *b_phoE1x5Full5x5;   //!
   TBranch        *b_phoE2x2Full5x5;   //!
   TBranch        *b_phoE2x5MaxFull5x5;   //!
   TBranch        *b_phoE5x5Full5x5;   //!
   TBranch        *b_phoR9Full5x5;   //!
   TBranch        *b_phoSeedBCE;   //!
   TBranch        *b_phoSeedBCEta;   //!
   TBranch        *b_phoPFChIso;   //!
   TBranch        *b_phoPFPhoIso;   //!
   TBranch        *b_phoPFNeuIso;   //!
   TBranch        *b_phoPFChWorstIso;   //!
   TBranch        *b_phoCITKChIso;   //!
   TBranch        *b_phoCITKPhoIso;   //!
   TBranch        *b_phoCITKNeuIso;   //!
   TBranch        *b_phoIDMVA;   //!
   TBranch        *b_phoFiredSingleTrgs;   //!
   TBranch        *b_phoFiredDoubleTrgs;   //!
   TBranch        *b_phoFiredL1Trgs;   //!
   TBranch        *b_phoSeedTime;   //!
   TBranch        *b_phoSeedEnergy;   //!
   TBranch        *b_phoScaleCorrUnc;   //!
   TBranch        *b_phoSmearUnc_nominal;   //!
   TBranch        *b_phoSmearUnc_rhoUp;   //!
   TBranch        *b_phoSmearUnc_rhoDown;   //!
   TBranch        *b_phoSmearUnc_phiUp;   //!
   TBranch        *b_phoSmearUnc_phiDown;   //!
   TBranch        *b_phoxtalBits;   //!
   TBranch        *b_phoIDbit;   //!
   TBranch        *b_npfPho;   //!
   TBranch        *b_pfphoEt;   //!
   TBranch        *b_pfphoEta;   //!
   TBranch        *b_pfphoPhi;   //!
   TBranch        *b_nEle;   //!
   TBranch        *b_eleCharge;   //!
   TBranch        *b_eleChargeConsistent;   //!
   TBranch        *b_eleEn;   //!
   TBranch        *b_eleSCEn;   //!
   TBranch        *b_eleESEn;   //!
   TBranch        *b_eleESEnP1;   //!
   TBranch        *b_eleESEnP2;   //!
   TBranch        *b_eleD0;   //!
   TBranch        *b_eleDz;   //!
   TBranch        *b_eleSIP;   //!
   TBranch        *b_elePt;   //!
   TBranch        *b_eleEta;   //!
   TBranch        *b_elePhi;   //!
   TBranch        *b_eleR9;   //!
   TBranch        *b_eleCalibPt;   //!
   TBranch        *b_eleCalibEn;   //!
   TBranch        *b_eleScaleSyst;   //!
   TBranch        *b_eleSmearRhoUp;   //!
   TBranch        *b_eleSmearRhoDo;   //!
   TBranch        *b_eleSmearPhiUp;   //!
   TBranch        *b_eleSmearPhiDo;   //!
   TBranch        *b_eleSCEta;   //!
   TBranch        *b_eleSCPhi;   //!
   TBranch        *b_eleSCRawEn;   //!
   TBranch        *b_eleSCEtaWidth;   //!
   TBranch        *b_eleSCPhiWidth;   //!
   TBranch        *b_eleHoverE;   //!
   TBranch        *b_eleEoverP;   //!
   TBranch        *b_eleEoverPout;   //!
   TBranch        *b_eleEoverPInv;   //!
   TBranch        *b_eleBrem;   //!
   TBranch        *b_eledEtaAtVtx;   //!
   TBranch        *b_eledPhiAtVtx;   //!
   TBranch        *b_eledEtaAtCalo;   //!
   TBranch        *b_eleSigmaIEtaIEtaFull5x5;   //!
   TBranch        *b_eleSigmaIPhiIPhiFull5x5;   //!
   TBranch        *b_eleConvVeto;   //!
   TBranch        *b_eleMissHits;   //!
   TBranch        *b_eleESEffSigmaRR;   //!
   TBranch        *b_elePFChIso;   //!
   TBranch        *b_elePFPhoIso;   //!
   TBranch        *b_elePFNeuIso;   //!
   TBranch        *b_elePFPUIso;   //!
   TBranch        *b_elePFClusEcalIso;   //!
   TBranch        *b_elePFClusHcalIso;   //!
   TBranch        *b_elePFMiniIso;   //!
   TBranch        *b_eleIDMVA;   //!
   TBranch        *b_eleIDMVAHZZ;   //!
   TBranch        *b_eledEtaseedAtVtx;   //!
   TBranch        *b_eleE1x5;   //!
   TBranch        *b_eleE2x5;   //!
   TBranch        *b_eleE5x5;   //!
   TBranch        *b_eleE1x5Full5x5;   //!
   TBranch        *b_eleE2x5Full5x5;   //!
   TBranch        *b_eleE5x5Full5x5;   //!
   TBranch        *b_eleR9Full5x5;   //!
   TBranch        *b_eleEcalDrivenSeed;   //!
   TBranch        *b_eleDr03EcalRecHitSumEt;   //!
   TBranch        *b_eleDr03HcalDepth1TowerSumEt;   //!
   TBranch        *b_eleDr03HcalDepth2TowerSumEt;   //!
   TBranch        *b_eleDr03HcalTowerSumEt;   //!
   TBranch        *b_eleDr03TkSumPt;   //!
   TBranch        *b_elecaloEnergy;   //!
   TBranch        *b_eleTrkdxy;   //!
   TBranch        *b_eleKFHits;   //!
   TBranch        *b_eleKFChi2;   //!
   TBranch        *b_eleGSFChi2;   //!
   TBranch        *b_eleGSFPt;   //!
   TBranch        *b_eleGSFEta;   //!
   TBranch        *b_eleGSFPhi;   //!
   TBranch        *b_eleGSFCharge;   //!
   TBranch        *b_eleGSFHits;   //!
   TBranch        *b_eleGSFMissHits;   //!
   TBranch        *b_eleGSFNHitsMax;   //!
   TBranch        *b_eleGSFVtxProb;   //!
   TBranch        *b_eleGSFlxyPV;   //!
   TBranch        *b_eleGSFlxyBS;   //!
   TBranch        *b_eleBCEn;   //!
   TBranch        *b_eleBCEta;   //!
   TBranch        *b_eleBCPhi;   //!
   TBranch        *b_eleBCS25;   //!
   TBranch        *b_eleBCS15;   //!
   TBranch        *b_eleBCSieie;   //!
   TBranch        *b_eleBCSieip;   //!
   TBranch        *b_eleBCSipip;   //!
   TBranch        *b_eleFiredSingleTrgs;   //!
   TBranch        *b_eleFiredDoubleTrgs;   //!
   TBranch        *b_eleFiredL1Trgs;   //!
   TBranch        *b_eleIDbit;   //!
   TBranch        *b_npfHF;   //!
   TBranch        *b_pfHFEn;   //!
   TBranch        *b_pfHFECALEn;   //!
   TBranch        *b_pfHFHCALEn;   //!
   TBranch        *b_pfHFPt;   //!
   TBranch        *b_pfHFEta;   //!
   TBranch        *b_pfHFPhi;   //!
   TBranch        *b_pfHFIso;   //!
   TBranch        *b_nMu;   //!
   TBranch        *b_muPt;   //!
   TBranch        *b_muEn;   //!
   TBranch        *b_muEta;   //!
   TBranch        *b_muPhi;   //!
   TBranch        *b_muCharge;   //!
   TBranch        *b_muType;   //!
   TBranch        *b_muIDbit;   //!
   TBranch        *b_muD0;   //!
   TBranch        *b_muDz;   //!
   TBranch        *b_muSIP;   //!
   TBranch        *b_muChi2NDF;   //!
   TBranch        *b_muInnerD0;   //!
   TBranch        *b_muInnerDz;   //!
   TBranch        *b_muTrkLayers;   //!
   TBranch        *b_muPixelLayers;   //!
   TBranch        *b_muPixelHits;   //!
   TBranch        *b_muMuonHits;   //!
   TBranch        *b_muStations;   //!
   TBranch        *b_muMatches;   //!
   TBranch        *b_muTrkQuality;   //!
   TBranch        *b_muIsoTrk;   //!
   TBranch        *b_muPFChIso;   //!
   TBranch        *b_muPFPhoIso;   //!
   TBranch        *b_muPFNeuIso;   //!
   TBranch        *b_muPFPUIso;   //!
   TBranch        *b_muPFMiniIso;   //!
   TBranch        *b_muFiredTrgs;   //!
   TBranch        *b_muFiredL1Trgs;   //!
   TBranch        *b_muInnervalidFraction;   //!
   TBranch        *b_musegmentCompatibility;   //!
   TBranch        *b_muchi2LocalPosition;   //!
   TBranch        *b_mutrkKink;   //!
   TBranch        *b_muBestTrkPtError;   //!
   TBranch        *b_muBestTrkPt;   //!
   TBranch        *b_nJet;   //!
   TBranch        *b_jetPt;   //!
   TBranch        *b_jetEn;   //!
   TBranch        *b_jetEta;   //!
   TBranch        *b_jetPhi;   //!
   TBranch        *b_jetRawPt;   //!
   TBranch        *b_jetRawEn;   //!
   TBranch        *b_jetMt;   //!
   TBranch        *b_jetArea;   //!
   TBranch        *b_jetMass;   //!
   TBranch        *b_jetPx;   //!
   TBranch        *b_jetPy;   //!
   TBranch        *b_jetPz;   //!
   TBranch        *b_jetLeadTrackPt;   //!
   TBranch        *b_jetLeadTrackEta;   //!
   TBranch        *b_jetLeadTrackPhi;   //!
   TBranch        *b_jetLepTrackPID;   //!
   TBranch        *b_jetLepTrackPt;   //!
   TBranch        *b_jetLepTrackEta;   //!
   TBranch        *b_jetLepTrackPhi;   //!
   TBranch        *b_jetCSV2BJetTags;   //!
   TBranch        *b_jetJetProbabilityBJetTags;   //!
   TBranch        *b_jetpfCombinedMVAV2BJetTags;   //!
   TBranch        *b_jetPartonID;   //!
   TBranch        *b_jetHadFlvr;   //!
   TBranch        *b_jetGenJetEn;   //!
   TBranch        *b_jetGenJetPt;   //!
   TBranch        *b_jetGenJetEta;   //!
   TBranch        *b_jetGenJetPhi;   //!
   TBranch        *b_jetGenPartonID;   //!
   TBranch        *b_jetGenEn;   //!
   TBranch        *b_jetGenPt;   //!
   TBranch        *b_jetGenEta;   //!
   TBranch        *b_jetGenPhi;   //!
   TBranch        *b_jetGenPartonMomID;   //!
   TBranch        *b_jetP4Smear;   //!
   TBranch        *b_jetP4SmearUp;   //!
   TBranch        *b_jetP4SmearDo;   //!
   TBranch        *b_jetPFLooseId;   //!
   TBranch        *b_jetID;   //!
   TBranch        *b_jetPUID;   //!
   TBranch        *b_jetJECUnc;   //!
   TBranch        *b_jetJERSmearing;   //!
   TBranch        *b_jetJERSmearingUp;   //!
   TBranch        *b_jetJERSmearingDown;   //!
   TBranch        *b_jetFiredTrgs;   //!
   TBranch        *b_jetCHF;   //!
   TBranch        *b_jetNHF;   //!
   TBranch        *b_jetCEF;   //!
   TBranch        *b_jetNEF;   //!
   TBranch        *b_jetNCH;   //!
   TBranch        *b_jetNNP;   //!
   TBranch        *b_jetMUF;   //!
   TBranch        *b_jetVtxPt;   //!
   TBranch        *b_jetVtxMass;   //!
   TBranch        *b_jetVtxNtrks;   //!
   TBranch        *b_jetVtx3DVal;   //!
   TBranch        *b_jetVtx3DSig;   //!
   TBranch        *b_jetHFHAE;   //!
   TBranch        *b_jetHFEME;   //!
   TBranch        *b_jetNConstituents;   //!
   TBranch        *b_nAK8Jet;   //!
   TBranch        *b_AK8JetPt;   //!
   TBranch        *b_AK8JetEn;   //!
   TBranch        *b_AK8JetRawPt;   //!
   TBranch        *b_AK8JetRawEn;   //!
   TBranch        *b_AK8JetEta;   //!
   TBranch        *b_AK8JetPhi;   //!
   TBranch        *b_AK8JetMass;   //!
   TBranch        *b_AK8Jet_tau1;   //!
   TBranch        *b_AK8Jet_tau2;   //!
   TBranch        *b_AK8Jet_tau3;   //!
   TBranch        *b_AK8JetCHF;   //!
   TBranch        *b_AK8JetNHF;   //!
   TBranch        *b_AK8JetCEF;   //!
   TBranch        *b_AK8JetNEF;   //!
   TBranch        *b_AK8JetNCH;   //!
   TBranch        *b_AK8JetNNP;   //!
   TBranch        *b_AK8JetMUF;   //!
   TBranch        *b_AK8Jetnconstituents;   //!
   TBranch        *b_AK8JetPFLooseId;   //!
   TBranch        *b_AK8JetPFTightLepVetoId;   //!
   TBranch        *b_AK8JetSoftDropMass;   //!
   TBranch        *b_AK8JetSoftDropMassCorr;   //!
   TBranch        *b_AK8JetPrunedMass;   //!
   TBranch        *b_AK8JetPrunedMassCorr;   //!
   TBranch        *b_AK8JetpfBoostedDSVBTag;   //!
   TBranch        *b_AK8JetDSVnewV4;   //!
   TBranch        *b_AK8JetCSV;   //!
   TBranch        *b_AK8JetJECUnc;   //!
   TBranch        *b_AK8JetL2L3corr;   //!
   TBranch        *b_AK8puppiPt;   //!
   TBranch        *b_AK8puppiMass;   //!
   TBranch        *b_AK8puppiEta;   //!
   TBranch        *b_AK8puppiPhi;   //!
   TBranch        *b_AK8puppiTau1;   //!
   TBranch        *b_AK8puppiTau2;   //!
   TBranch        *b_AK8puppiTau3;   //!
   TBranch        *b_AK8puppiSDL2L3corr;   //!
   TBranch        *b_AK8puppiSDMass;   //!
   TBranch        *b_AK8puppiSDMassL2L3Corr;   //!
   TBranch        *b_AK8JetPartonID;   //!
   TBranch        *b_AK8JetHadFlvr;   //!
   TBranch        *b_AK8JetGenJetIndex;   //!
   TBranch        *b_AK8JetGenJetEn;   //!
   TBranch        *b_AK8JetGenJetPt;   //!
   TBranch        *b_AK8JetGenJetEta;   //!
   TBranch        *b_AK8JetGenJetPhi;   //!
   TBranch        *b_AK8JetGenPartonID;   //!
   TBranch        *b_AK8JetGenEn;   //!
   TBranch        *b_AK8JetGenPt;   //!
   TBranch        *b_AK8JetGenEta;   //!
   TBranch        *b_AK8JetGenPhi;   //!
   TBranch        *b_AK8JetGenPartonMomID;   //!
   TBranch        *b_AK8JetP4Smear;   //!
   TBranch        *b_AK8JetP4SmearUp;   //!
   TBranch        *b_AK8JetP4SmearDo;   //!
   TBranch        *b_nAK8SDSJ;   //!
   TBranch        *b_AK8SDSJPt;   //!
   TBranch        *b_AK8SDSJEta;   //!
   TBranch        *b_AK8SDSJPhi;   //!
   TBranch        *b_AK8SDSJMass;   //!
   TBranch        *b_AK8SDSJE;   //!
   TBranch        *b_AK8SDSJCharge;   //!
   TBranch        *b_AK8SDSJFlavour;   //!
   TBranch        *b_AK8SDSJCSV;   //!
   TBranch        *b_nAK8puppiSDSJ;   //!
   TBranch        *b_AK8puppiSDSJPt;   //!
   TBranch        *b_AK8puppiSDSJEta;   //!
   TBranch        *b_AK8puppiSDSJPhi;   //!
   TBranch        *b_AK8puppiSDSJMass;   //!
   TBranch        *b_AK8puppiSDSJE;   //!
   TBranch        *b_AK8puppiSDSJCharge;   //!
   TBranch        *b_AK8puppiSDSJFlavour;   //!
   TBranch        *b_AK8puppiSDSJCSV;   //!

   PostAnalyzer_MC(TTree *tree=0);
   virtual ~PostAnalyzer_MC();
   virtual Int_t    Cut(Long64_t entry);
   virtual Int_t    GetEntry(Long64_t entry);
   virtual Long64_t LoadTree(Long64_t entry);
   virtual void     Init(TTree *tree);
   virtual void     Loop();
   virtual Bool_t   Notify();
   virtual void     Show(Long64_t entry = -1);
   //User-Defined functions
   //   virtual Bool_t   GoodPrimaryVtx(Int_t &GoodVertex);

   virtual Bool_t   CutBasedPhotonID(Int_t ipho, TString phoWP);
   virtual Double_t EAChargedHadrons(Double_t eta);
   virtual Double_t EANeutralHadrons(Double_t eta);
   virtual Double_t EAPhotons(Double_t eta);
   virtual Int_t    FirstGoodPhoton(TString phoWP); 
   virtual vector<Int_t> GoodPhotons(TString phoWP); 

   virtual Bool_t   ResSpikes(Int_t);
   virtual Bool_t   JetId(Int_t iJet, TString jetWP);
   virtual Int_t    FirstGoodJet(TString jetWP);
   virtual vector<Int_t> GoodJets(TString jetWP);

   //For 80X (WP cuts need to change for 76X)
   virtual Bool_t   CSVv2bTag(Int_t ijet, TString WP);
   virtual Double_t CSVv2bTagSF(BTagEntry::OperatingPoint OP, BTagEntry::JetFlavor JF, std::string sys_type, Double_t JetPt, Double_t JetEta);
   virtual Double_t CSVv2bTagSF_auto(BTagEntry::OperatingPoint OP, BTagEntry::JetFlavor JF, std::string sys_type, Double_t JetPt, Double_t JetEta);
   virtual Double_t BTagEventWeight(Double_t ScaleFactor, UInt_t nBTags);

   virtual Double_t GetdEta(Double_t eta1, Double_t eta2);
   virtual Double_t GetdPhi(Double_t phi1, Double_t phi2);
   virtual Double_t GetdR(Double_t eta1, Double_t eta2, Double_t phi1, Double_t phi2);
   virtual Double_t GetCosThetaStar(Double_t eta1, Double_t eta2);
   virtual Double_t GetInvtMass(Int_t ph, Int_t jet);

   virtual Bool_t   IsPromptFound();
   virtual Bool_t   IsPromptFoundOutOf_dR(Double_t dR_Req);
   virtual Bool_t   IsPromptFoundInsideOf_dR(Double_t dR_Req);
   virtual Int_t    MatchedPromptGenPhotonToReco(Int_t pc);
   virtual Int_t    MatchedNonPromptGenPhotonToReco(Int_t pc);
   virtual Int_t    MatchedGenJetToReco(Int_t jc);
   virtual Bool_t   IsOverlappedEvent(Int_t pc);
   virtual Double_t GetGenLevelInvtMass(Int_t pc_gen, Int_t jc_gen);

   virtual void     PileupReWeighting();
   virtual Double_t PUWeights(Float_t npv);

   virtual void     BookHistograms();


};

#endif

#ifdef PostAnalyzer_MC_cxx
PostAnalyzer_MC::PostAnalyzer_MC(TTree *tree) : fChain(0) 
{
// if parameter tree is not specified (or zero), connect the file
// used to generate this class and read the Tree.
   if (tree == 0) {

#ifdef SINGLE_TREE
      // The following code should be used if you want this class to access
      // a single tree instead of a chain
      TFile *f = (TFile*)gROOT->GetListOfFiles()->FindObject("Memory Directory");
      if (!f || !f->IsOpen()) {
         f = new TFile("Memory Directory");
      }
      f->GetObject("ggNtuplizer/EventTree",tree);

#else // SINGLE_TREE

      // The following code should be used if you want this class to access a chain
      // of trees.
      TChain * chain = new TChain("ggNtuplizer/EventTree","");
      //chain->Add("/eos/uscms/store/user/lpcqstar/13TeV/Ntuples/80X/MC/GJ_madgraph/GJets_HT100To200/MC_GJets_HT100To200_14.root/ggNtuplizer/EventTree");
      //chain->Add("/eos/uscms/store/user/rocky86/13TeV/Ntuples/80X/MC/GJ_madgraph/GJets_HT-400To600/MC_GJets_HT-400To600_23.root/ggNtuplizer/EventTree");
      //chain->Add("/eos/uscms/store/user/lpcqstar/13TeV/Ntuples/80X/MC/Summer16TrancheIV/EWK/WJetsToLNu/WJetsToLNu_10.root/ggNtuplizer/EventTree");
      //chain->Add("/eos/uscms/store/user/lpcqstar/13TeV/Ntuples/80X/MC/Summer16TrancheIV/GJ_madgraph/GJets_HT100To200/GJets_HT100To200_2.root/ggNtuplizer/EventTree");
      //chain->Add("/eos/uscms/store/user/rocky86/13TeV/Ntuples/80X/MC/Dijet/QCD_Pt_300to470/MC_QCD_Pt_300to470_24.root/ggNtuplizer/EventTree");
      //chain->Add("/eos/uscms/store/user/rocky86/13TeV/Ntuples/80X/MC/EWK/DYJetsToLL_Pt-250To400/MC_DYJetsToLL_Pt-250To400_10.root/ggNtuplizer/EventTree");
      //chain->Add("/eos/uscms/store/user/lpcqstar/13TeV/Ntuples/80X/MC/Dijet/QCD_Pt300to470/MC_QCD_Pt300to470_120.root/ggNtuplizer/EventTree");
      //chain->Add("/eos/uscms/store/user/lpcqstar/13TeV/Ntuples/80X/MC/Dijet/QCD_Pt300to470/MC_QCD_Pt300to470_122.root/ggNtuplizer/EventTree");
      
      //Uncomment this part in script
      //-----------------------------
       
      TString main_path = "${sourceDir}";

      TSystemDirectory sourceDir("sysDir",main_path);
      TList* fileList = sourceDir.GetListOfFiles();
      TIter next(fileList);
      TSystemFile* fileName;

      int fileNumber = 1;
      int maxFiles = -1;

      while ((fileName = (TSystemFile*)next()) && fileNumber > maxFiles){
        if(TString(fileName->GetName()) == "." || TString(fileName->GetName()) == ".."){continue;}

	TString FullPathInputFile = (main_path+fileName->GetName());

      //      cout << FullPathInputFile << endl;

        chain->Add(FullPathInputFile+"/ggNtuplizer/EventTree");

        fileNumber++;

      }
      cout << "Total files in this set = " << fileNumber - 1 << endl; 

      //-----------------------------

      tree = chain;
#endif // SINGLE_TREE

   }
   Init(tree);
}

PostAnalyzer_MC::~PostAnalyzer_MC()
{
   if (!fChain) return;
   delete fChain->GetCurrentFile();
   file->cd();
   file->Write();
   file->Close();
}

Int_t PostAnalyzer_MC::GetEntry(Long64_t entry)
{
// Read contents of entry.
   if (!fChain) return 0;
   return fChain->GetEntry(entry);
}
Long64_t PostAnalyzer_MC::LoadTree(Long64_t entry)
{
// Set the environment to read one entry
   if (!fChain) return -5;
   Long64_t centry = fChain->LoadTree(entry);
   if (centry < 0) return centry;
   if (fChain->GetTreeNumber() != fCurrent) {
      fCurrent = fChain->GetTreeNumber();
      Notify();
   }
   return centry;
}

void PostAnalyzer_MC::Init(TTree *tree)
{
   // The Init() function is called when the selector needs to initialize
   // a new tree or chain. Typically here the branch addresses and branch
   // pointers of the tree will be set.
   // It is normally not necessary to make changes to the generated
   // code, but the routine can be extended by the user if needed.
   // Init() will be called many times when running on PROOF
   // (once per file to be processed).

   // Set object pointer
   phoPrescale = 0;
   pdf = 0;
   EventTag = 0;
   nPU = 0;
   puBX = 0;
   puTrue = 0;
   mcPID = 0;
   mcVtx = 0;
   mcVty = 0;
   mcVtz = 0;
   mcPt = 0;
   mcMass = 0;
   mcEta = 0;
   mcPhi = 0;
   mcE = 0;
   mcEt = 0;
   mcGMomPID = 0;
   mcMomPID = 0;
   mcMomPt = 0;
   mcMomMass = 0;
   mcMomEta = 0;
   mcMomPhi = 0;
   mcIndex = 0;
   mcStatusFlag = 0;
   mcParentage = 0;
   mcStatus = 0;
   mcCalIsoDR03 = 0;
   mcTrkIsoDR03 = 0;
   mcCalIsoDR04 = 0;
   mcTrkIsoDR04 = 0;
   phoE = 0;
   phoEt = 0;
   phoEta = 0;
   phoPhi = 0;
   phoPx = 0;
   phoPy = 0;
   phoPz = 0;
   phoCalibE = 0;
   phoCalibEt = 0;
   phoSCE = 0;
   phoSCRawE = 0;
   phoESEn = 0;
   phoESEnP1 = 0;
   phoESEnP2 = 0;
   phoSCEta = 0;
   phoSCPhi = 0;
   phoSCEtaWidth = 0;
   phoSCPhiWidth = 0;
   phoSCBrem = 0;
   phohasPixelSeed = 0;
   phoEleVeto = 0;
   phoR9 = 0;
   phoHoverE = 0;
   phoE1x3 = 0;
   phoE1x5 = 0;
   phoE2x2 = 0;
   phoE2x5Max = 0;
   phoE5x5 = 0;
   phoESEffSigmaRR = 0;
   phomaxXtalenergyFull5x5 = 0;
   phoSigmaIEtaIEtaFull5x5 = 0;
   phoSigmaIEtaIPhiFull5x5 = 0;
   phoSigmaIPhiIPhiFull5x5 = 0;
   phoE1x3Full5x5 = 0;
   phoE1x5Full5x5 = 0;
   phoE2x2Full5x5 = 0;
   phoE2x5MaxFull5x5 = 0;
   phoE5x5Full5x5 = 0;
   phoR9Full5x5 = 0;
   phoSeedBCE = 0;
   phoSeedBCEta = 0;
   phoPFChIso = 0;
   phoPFPhoIso = 0;
   phoPFNeuIso = 0;
   phoPFChWorstIso = 0;
   phoCITKChIso = 0;
   phoCITKPhoIso = 0;
   phoCITKNeuIso = 0;
   phoIDMVA = 0;
   phoFiredSingleTrgs = 0;
   phoFiredDoubleTrgs = 0;
   phoFiredL1Trgs = 0;
   phoSeedTime = 0;
   phoSeedEnergy = 0;
   phoScaleCorrUnc = 0;
   phoSmearUnc_nominal = 0;
   phoSmearUnc_rhoUp = 0;
   phoSmearUnc_rhoDown = 0;
   phoSmearUnc_phiUp = 0;
   phoSmearUnc_phiDown = 0;
   phoxtalBits = 0;
   phoIDbit = 0;
   pfphoEt = 0;
   pfphoEta = 0;
   pfphoPhi = 0;
   eleCharge = 0;
   eleChargeConsistent = 0;
   eleEn = 0;
   eleSCEn = 0;
   eleESEn = 0;
   eleESEnP1 = 0;
   eleESEnP2 = 0;
   eleD0 = 0;
   eleDz = 0;
   eleSIP = 0;
   elePt = 0;
   eleEta = 0;
   elePhi = 0;
   eleR9 = 0;
   eleCalibPt = 0;
   eleCalibEn = 0;
   eleScaleSyst = 0;
   eleSmearRhoUp = 0;
   eleSmearRhoDo = 0;
   eleSmearPhiUp = 0;
   eleSmearPhiDo = 0;
   eleSCEta = 0;
   eleSCPhi = 0;
   eleSCRawEn = 0;
   eleSCEtaWidth = 0;
   eleSCPhiWidth = 0;
   eleHoverE = 0;
   eleEoverP = 0;
   eleEoverPout = 0;
   eleEoverPInv = 0;
   eleBrem = 0;
   eledEtaAtVtx = 0;
   eledPhiAtVtx = 0;
   eledEtaAtCalo = 0;
   eleSigmaIEtaIEtaFull5x5 = 0;
   eleSigmaIPhiIPhiFull5x5 = 0;
   eleConvVeto = 0;
   eleMissHits = 0;
   eleESEffSigmaRR = 0;
   elePFChIso = 0;
   elePFPhoIso = 0;
   elePFNeuIso = 0;
   elePFPUIso = 0;
   elePFClusEcalIso = 0;
   elePFClusHcalIso = 0;
   elePFMiniIso = 0;
   eleIDMVA = 0;
   eleIDMVAHZZ = 0;
   eledEtaseedAtVtx = 0;
   eleE1x5 = 0;
   eleE2x5 = 0;
   eleE5x5 = 0;
   eleE1x5Full5x5 = 0;
   eleE2x5Full5x5 = 0;
   eleE5x5Full5x5 = 0;
   eleR9Full5x5 = 0;
   eleEcalDrivenSeed = 0;
   eleDr03EcalRecHitSumEt = 0;
   eleDr03HcalDepth1TowerSumEt = 0;
   eleDr03HcalDepth2TowerSumEt = 0;
   eleDr03HcalTowerSumEt = 0;
   eleDr03TkSumPt = 0;
   elecaloEnergy = 0;
   eleTrkdxy = 0;
   eleKFHits = 0;
   eleKFChi2 = 0;
   eleGSFChi2 = 0;
   eleGSFPt = 0;
   eleGSFEta = 0;
   eleGSFPhi = 0;
   eleGSFCharge = 0;
   eleGSFHits = 0;
   eleGSFMissHits = 0;
   eleGSFNHitsMax = 0;
   eleGSFVtxProb = 0;
   eleGSFlxyPV = 0;
   eleGSFlxyBS = 0;
   eleBCEn = 0;
   eleBCEta = 0;
   eleBCPhi = 0;
   eleBCS25 = 0;
   eleBCS15 = 0;
   eleBCSieie = 0;
   eleBCSieip = 0;
   eleBCSipip = 0;
   eleFiredSingleTrgs = 0;
   eleFiredDoubleTrgs = 0;
   eleFiredL1Trgs = 0;
   eleIDbit = 0;
   pfHFEn = 0;
   pfHFECALEn = 0;
   pfHFHCALEn = 0;
   pfHFPt = 0;
   pfHFEta = 0;
   pfHFPhi = 0;
   pfHFIso = 0;
   muPt = 0;
   muEn = 0;
   muEta = 0;
   muPhi = 0;
   muCharge = 0;
   muType = 0;
   muIDbit = 0;
   muD0 = 0;
   muDz = 0;
   muSIP = 0;
   muChi2NDF = 0;
   muInnerD0 = 0;
   muInnerDz = 0;
   muTrkLayers = 0;
   muPixelLayers = 0;
   muPixelHits = 0;
   muMuonHits = 0;
   muStations = 0;
   muMatches = 0;
   muTrkQuality = 0;
   muIsoTrk = 0;
   muPFChIso = 0;
   muPFPhoIso = 0;
   muPFNeuIso = 0;
   muPFPUIso = 0;
   muPFMiniIso = 0;
   muFiredTrgs = 0;
   muFiredL1Trgs = 0;
   muInnervalidFraction = 0;
   musegmentCompatibility = 0;
   muchi2LocalPosition = 0;
   mutrkKink = 0;
   muBestTrkPtError = 0;
   muBestTrkPt = 0;
   jetPt = 0;
   jetEn = 0;
   jetEta = 0;
   jetPhi = 0;
   jetRawPt = 0;
   jetRawEn = 0;
   jetMt = 0;
   jetArea = 0;
   jetMass = 0;
   jetPx = 0;
   jetPy = 0;
   jetPz = 0;
   jetLeadTrackPt = 0;
   jetLeadTrackEta = 0;
   jetLeadTrackPhi = 0;
   jetLepTrackPID = 0;
   jetLepTrackPt = 0;
   jetLepTrackEta = 0;
   jetLepTrackPhi = 0;
   jetCSV2BJetTags = 0;
   jetJetProbabilityBJetTags = 0;
   jetpfCombinedMVAV2BJetTags = 0;
   jetPartonID = 0;
   jetHadFlvr = 0;
   jetGenJetEn = 0;
   jetGenJetPt = 0;
   jetGenJetEta = 0;
   jetGenJetPhi = 0;
   jetGenPartonID = 0;
   jetGenEn = 0;
   jetGenPt = 0;
   jetGenEta = 0;
   jetGenPhi = 0;
   jetGenPartonMomID = 0;
   jetP4Smear = 0;
   jetP4SmearUp = 0;
   jetP4SmearDo = 0;
   jetPFLooseId = 0;
   jetID = 0;
   jetPUID = 0;
   jetJECUnc = 0;
   jetJERSmearing = 0;
   jetJERSmearingUp = 0;
   jetJERSmearingDown = 0;
   jetFiredTrgs = 0;
   jetCHF = 0;
   jetNHF = 0;
   jetCEF = 0;
   jetNEF = 0;
   jetNCH = 0;
   jetNNP = 0;
   jetMUF = 0;
   jetVtxPt = 0;
   jetVtxMass = 0;
   jetVtxNtrks = 0;
   jetVtx3DVal = 0;
   jetVtx3DSig = 0;
   jetHFHAE = 0;
   jetHFEME = 0;
   jetNConstituents = 0;
   AK8JetPt = 0;
   AK8JetEn = 0;
   AK8JetRawPt = 0;
   AK8JetRawEn = 0;
   AK8JetEta = 0;
   AK8JetPhi = 0;
   AK8JetMass = 0;
   AK8Jet_tau1 = 0;
   AK8Jet_tau2 = 0;
   AK8Jet_tau3 = 0;
   AK8JetCHF = 0;
   AK8JetNHF = 0;
   AK8JetCEF = 0;
   AK8JetNEF = 0;
   AK8JetNCH = 0;
   AK8JetNNP = 0;
   AK8JetMUF = 0;
   AK8Jetnconstituents = 0;
   AK8JetPFLooseId = 0;
   AK8JetPFTightLepVetoId = 0;
   AK8JetSoftDropMass = 0;
   AK8JetSoftDropMassCorr = 0;
   AK8JetPrunedMass = 0;
   AK8JetPrunedMassCorr = 0;
   AK8JetpfBoostedDSVBTag = 0;
   AK8JetDSVnewV4 = 0;
   AK8JetCSV = 0;
   AK8JetJECUnc = 0;
   AK8JetL2L3corr = 0;
   AK8puppiPt = 0;
   AK8puppiMass = 0;
   AK8puppiEta = 0;
   AK8puppiPhi = 0;
   AK8puppiTau1 = 0;
   AK8puppiTau2 = 0;
   AK8puppiTau3 = 0;
   AK8puppiSDL2L3corr = 0;
   AK8puppiSDMass = 0;
   AK8puppiSDMassL2L3Corr = 0;
   AK8JetPartonID = 0;
   AK8JetHadFlvr = 0;
   AK8JetGenJetIndex = 0;
   AK8JetGenJetEn = 0;
   AK8JetGenJetPt = 0;
   AK8JetGenJetEta = 0;
   AK8JetGenJetPhi = 0;
   AK8JetGenPartonID = 0;
   AK8JetGenEn = 0;
   AK8JetGenPt = 0;
   AK8JetGenEta = 0;
   AK8JetGenPhi = 0;
   AK8JetGenPartonMomID = 0;
   AK8JetP4Smear = 0;
   AK8JetP4SmearUp = 0;
   AK8JetP4SmearDo = 0;
   nAK8SDSJ = 0;
   AK8SDSJPt = 0;
   AK8SDSJEta = 0;
   AK8SDSJPhi = 0;
   AK8SDSJMass = 0;
   AK8SDSJE = 0;
   AK8SDSJCharge = 0;
   AK8SDSJFlavour = 0;
   AK8SDSJCSV = 0;
   nAK8puppiSDSJ = 0;
   AK8puppiSDSJPt = 0;
   AK8puppiSDSJEta = 0;
   AK8puppiSDSJPhi = 0;
   AK8puppiSDSJMass = 0;
   AK8puppiSDSJE = 0;
   AK8puppiSDSJCharge = 0;
   AK8puppiSDSJFlavour = 0;
   AK8puppiSDSJCSV = 0;
   // Set branch addresses and branch pointers
   if (!tree) return;
   fChain = tree;
   fCurrent = -1;
   fChain->SetMakeClass(1);

   fChain->SetBranchAddress("run", &run, &b_run);
   fChain->SetBranchAddress("event", &event, &b_event);
   fChain->SetBranchAddress("lumis", &lumis, &b_lumis);
   fChain->SetBranchAddress("isData", &isData, &b_isData);
   fChain->SetBranchAddress("nVtx", &nVtx, &b_nVtx);
   fChain->SetBranchAddress("nGoodVtx", &nGoodVtx, &b_nGoodVtx);
   fChain->SetBranchAddress("nTrksPV", &nTrksPV, &b_nTrksPV);
   fChain->SetBranchAddress("isPVGood", &isPVGood, &b_isPVGood);
   fChain->SetBranchAddress("vtx", &vtx, &b_vtx);
   fChain->SetBranchAddress("vty", &vty, &b_vty);
   fChain->SetBranchAddress("vtz", &vtz, &b_vtz);
   fChain->SetBranchAddress("rho", &rho, &b_rho);
   fChain->SetBranchAddress("rhoCentral", &rhoCentral, &b_rhoCentral);
   fChain->SetBranchAddress("HLTEleMuX", &HLTEleMuX, &b_HLTEleMuX);
   fChain->SetBranchAddress("HLTPho", &HLTPho, &b_HLTPho);
   fChain->SetBranchAddress("HLTJet", &HLTJet, &b_HLTJet);
   fChain->SetBranchAddress("HLTEleMuXIsPrescaled", &HLTEleMuXIsPrescaled, &b_HLTEleMuXIsPrescaled);
   fChain->SetBranchAddress("HLTPhoIsPrescaled", &HLTPhoIsPrescaled, &b_HLTPhoIsPrescaled);
   fChain->SetBranchAddress("HLTJetIsPrescaled", &HLTJetIsPrescaled, &b_HLTJetIsPrescaled);
   fChain->SetBranchAddress("phoPrescale", &phoPrescale, &b_phoPrescale);
   fChain->SetBranchAddress("pdf", &pdf, &b_pdf);
   fChain->SetBranchAddress("pthat", &pthat, &b_pthat);
   fChain->SetBranchAddress("processID", &processID, &b_processID);
   fChain->SetBranchAddress("genWeight", &genWeight, &b_genWeight);
   fChain->SetBranchAddress("genHT", &genHT, &b_genHT);
   fChain->SetBranchAddress("EventTag", &EventTag, &b_EventTag);
   fChain->SetBranchAddress("nPUInfo", &nPUInfo, &b_nPUInfo);
   fChain->SetBranchAddress("nPU", &nPU, &b_nPU);
   fChain->SetBranchAddress("puBX", &puBX, &b_puBX);
   fChain->SetBranchAddress("puTrue", &puTrue, &b_puTrue);
   fChain->SetBranchAddress("nMC", &nMC, &b_nMC);
   fChain->SetBranchAddress("mcPID", &mcPID, &b_mcPID);
   fChain->SetBranchAddress("mcVtx", &mcVtx, &b_mcVtx);
   fChain->SetBranchAddress("mcVty", &mcVty, &b_mcVty);
   fChain->SetBranchAddress("mcVtz", &mcVtz, &b_mcVtz);
   fChain->SetBranchAddress("mcPt", &mcPt, &b_mcPt);
   fChain->SetBranchAddress("mcMass", &mcMass, &b_mcMass);
   fChain->SetBranchAddress("mcEta", &mcEta, &b_mcEta);
   fChain->SetBranchAddress("mcPhi", &mcPhi, &b_mcPhi);
   fChain->SetBranchAddress("mcE", &mcE, &b_mcE);
   fChain->SetBranchAddress("mcEt", &mcEt, &b_mcEt);
   fChain->SetBranchAddress("mcGMomPID", &mcGMomPID, &b_mcGMomPID);
   fChain->SetBranchAddress("mcMomPID", &mcMomPID, &b_mcMomPID);
   fChain->SetBranchAddress("mcMomPt", &mcMomPt, &b_mcMomPt);
   fChain->SetBranchAddress("mcMomMass", &mcMomMass, &b_mcMomMass);
   fChain->SetBranchAddress("mcMomEta", &mcMomEta, &b_mcMomEta);
   fChain->SetBranchAddress("mcMomPhi", &mcMomPhi, &b_mcMomPhi);
   fChain->SetBranchAddress("mcIndex", &mcIndex, &b_mcIndex);
   fChain->SetBranchAddress("mcStatusFlag", &mcStatusFlag, &b_mcStatusFlag);
   fChain->SetBranchAddress("mcParentage", &mcParentage, &b_mcParentage);
   fChain->SetBranchAddress("mcStatus", &mcStatus, &b_mcStatus);
   fChain->SetBranchAddress("mcCalIsoDR03", &mcCalIsoDR03, &b_mcCalIsoDR03);
   fChain->SetBranchAddress("mcTrkIsoDR03", &mcTrkIsoDR03, &b_mcTrkIsoDR03);
   fChain->SetBranchAddress("mcCalIsoDR04", &mcCalIsoDR04, &b_mcCalIsoDR04);
   fChain->SetBranchAddress("mcTrkIsoDR04", &mcTrkIsoDR04, &b_mcTrkIsoDR04);
   fChain->SetBranchAddress("genMET", &genMET, &b_genMET);
   fChain->SetBranchAddress("genMETPhi", &genMETPhi, &b_genMETPhi);
   fChain->SetBranchAddress("metFilters", &metFilters, &b_metFilters);
   fChain->SetBranchAddress("pfMET", &pfMET, &b_pfMET);
   fChain->SetBranchAddress("pfMETPhi", &pfMETPhi, &b_pfMETPhi);
   fChain->SetBranchAddress("pfMETsumEt", &pfMETsumEt, &b_pfMETsumEt);
   fChain->SetBranchAddress("pfMETmEtSig", &pfMETmEtSig, &b_pfMETmEtSig);
   fChain->SetBranchAddress("pfMETSig", &pfMETSig, &b_pfMETSig);
   fChain->SetBranchAddress("pfMET_T1JERUp", &pfMET_T1JERUp, &b_pfMET_T1JERUp);
   fChain->SetBranchAddress("pfMET_T1JERDo", &pfMET_T1JERDo, &b_pfMET_T1JERDo);
   fChain->SetBranchAddress("pfMET_T1JESUp", &pfMET_T1JESUp, &b_pfMET_T1JESUp);
   fChain->SetBranchAddress("pfMET_T1JESDo", &pfMET_T1JESDo, &b_pfMET_T1JESDo);
   fChain->SetBranchAddress("pfMET_T1UESUp", &pfMET_T1UESUp, &b_pfMET_T1UESUp);
   fChain->SetBranchAddress("pfMET_T1UESDo", &pfMET_T1UESDo, &b_pfMET_T1UESDo);
   fChain->SetBranchAddress("pfMETPhi_T1JESUp", &pfMETPhi_T1JESUp, &b_pfMETPhi_T1JESUp);
   fChain->SetBranchAddress("pfMETPhi_T1JESDo", &pfMETPhi_T1JESDo, &b_pfMETPhi_T1JESDo);
   fChain->SetBranchAddress("pfMETPhi_T1UESUp", &pfMETPhi_T1UESUp, &b_pfMETPhi_T1UESUp);
   fChain->SetBranchAddress("pfMETPhi_T1UESDo", &pfMETPhi_T1UESDo, &b_pfMETPhi_T1UESDo);
   fChain->SetBranchAddress("nPho", &nPho, &b_nPho);
   fChain->SetBranchAddress("phoE", &phoE, &b_phoE);
   fChain->SetBranchAddress("phoEt", &phoEt, &b_phoEt);
   fChain->SetBranchAddress("phoEta", &phoEta, &b_phoEta);
   fChain->SetBranchAddress("phoPhi", &phoPhi, &b_phoPhi);
   fChain->SetBranchAddress("phoPx", &phoPx, &b_phoPx);
   fChain->SetBranchAddress("phoPy", &phoPy, &b_phoPy);
   fChain->SetBranchAddress("phoPz", &phoPz, &b_phoPz);
   fChain->SetBranchAddress("phoCalibE", &phoCalibE, &b_phoCalibE);
   fChain->SetBranchAddress("phoCalibEt", &phoCalibEt, &b_phoCalibEt);
   fChain->SetBranchAddress("phoSCE", &phoSCE, &b_phoSCE);
   fChain->SetBranchAddress("phoSCRawE", &phoSCRawE, &b_phoSCRawE);
   fChain->SetBranchAddress("phoESEn", &phoESEn, &b_phoESEn);
   fChain->SetBranchAddress("phoESEnP1", &phoESEnP1, &b_phoESEnP1);
   fChain->SetBranchAddress("phoESEnP2", &phoESEnP2, &b_phoESEnP2);
   fChain->SetBranchAddress("phoSCEta", &phoSCEta, &b_phoSCEta);
   fChain->SetBranchAddress("phoSCPhi", &phoSCPhi, &b_phoSCPhi);
   fChain->SetBranchAddress("phoSCEtaWidth", &phoSCEtaWidth, &b_phoSCEtaWidth);
   fChain->SetBranchAddress("phoSCPhiWidth", &phoSCPhiWidth, &b_phoSCPhiWidth);
   fChain->SetBranchAddress("phoSCBrem", &phoSCBrem, &b_phoSCBrem);
   fChain->SetBranchAddress("phohasPixelSeed", &phohasPixelSeed, &b_phohasPixelSeed);
   fChain->SetBranchAddress("phoEleVeto", &phoEleVeto, &b_phoEleVeto);
   fChain->SetBranchAddress("phoR9", &phoR9, &b_phoR9);
   fChain->SetBranchAddress("phoHoverE", &phoHoverE, &b_phoHoverE);
   fChain->SetBranchAddress("phoE1x3", &phoE1x3, &b_phoE1x3);
   fChain->SetBranchAddress("phoE1x5", &phoE1x5, &b_phoE1x5);
   fChain->SetBranchAddress("phoE2x2", &phoE2x2, &b_phoE2x2);
   fChain->SetBranchAddress("phoE2x5Max", &phoE2x5Max, &b_phoE2x5Max);
   fChain->SetBranchAddress("phoE5x5", &phoE5x5, &b_phoE5x5);
   fChain->SetBranchAddress("phoESEffSigmaRR", &phoESEffSigmaRR, &b_phoESEffSigmaRR);
   fChain->SetBranchAddress("phomaxXtalenergyFull5x5", &phomaxXtalenergyFull5x5, &b_phomaxXtalenergyFull5x5);
   fChain->SetBranchAddress("phoSigmaIEtaIEtaFull5x5", &phoSigmaIEtaIEtaFull5x5, &b_phoSigmaIEtaIEtaFull5x5);
   fChain->SetBranchAddress("phoSigmaIEtaIPhiFull5x5", &phoSigmaIEtaIPhiFull5x5, &b_phoSigmaIEtaIPhiFull5x5);
   fChain->SetBranchAddress("phoSigmaIPhiIPhiFull5x5", &phoSigmaIPhiIPhiFull5x5, &b_phoSigmaIPhiIPhiFull5x5);
   fChain->SetBranchAddress("phoE1x3Full5x5", &phoE1x3Full5x5, &b_phoE1x3Full5x5);
   fChain->SetBranchAddress("phoE1x5Full5x5", &phoE1x5Full5x5, &b_phoE1x5Full5x5);
   fChain->SetBranchAddress("phoE2x2Full5x5", &phoE2x2Full5x5, &b_phoE2x2Full5x5);
   fChain->SetBranchAddress("phoE2x5MaxFull5x5", &phoE2x5MaxFull5x5, &b_phoE2x5MaxFull5x5);
   fChain->SetBranchAddress("phoE5x5Full5x5", &phoE5x5Full5x5, &b_phoE5x5Full5x5);
   fChain->SetBranchAddress("phoR9Full5x5", &phoR9Full5x5, &b_phoR9Full5x5);
   fChain->SetBranchAddress("phoSeedBCE", &phoSeedBCE, &b_phoSeedBCE);
   fChain->SetBranchAddress("phoSeedBCEta", &phoSeedBCEta, &b_phoSeedBCEta);
   fChain->SetBranchAddress("phoPFChIso", &phoPFChIso, &b_phoPFChIso);
   fChain->SetBranchAddress("phoPFPhoIso", &phoPFPhoIso, &b_phoPFPhoIso);
   fChain->SetBranchAddress("phoPFNeuIso", &phoPFNeuIso, &b_phoPFNeuIso);
   fChain->SetBranchAddress("phoPFChWorstIso", &phoPFChWorstIso, &b_phoPFChWorstIso);
   fChain->SetBranchAddress("phoCITKChIso", &phoCITKChIso, &b_phoCITKChIso);
   fChain->SetBranchAddress("phoCITKPhoIso", &phoCITKPhoIso, &b_phoCITKPhoIso);
   fChain->SetBranchAddress("phoCITKNeuIso", &phoCITKNeuIso, &b_phoCITKNeuIso);
   fChain->SetBranchAddress("phoIDMVA", &phoIDMVA, &b_phoIDMVA);
   fChain->SetBranchAddress("phoFiredSingleTrgs", &phoFiredSingleTrgs, &b_phoFiredSingleTrgs);
   fChain->SetBranchAddress("phoFiredDoubleTrgs", &phoFiredDoubleTrgs, &b_phoFiredDoubleTrgs);
   fChain->SetBranchAddress("phoFiredL1Trgs", &phoFiredL1Trgs, &b_phoFiredL1Trgs);
   fChain->SetBranchAddress("phoSeedTime", &phoSeedTime, &b_phoSeedTime);
   fChain->SetBranchAddress("phoSeedEnergy", &phoSeedEnergy, &b_phoSeedEnergy);
   fChain->SetBranchAddress("phoScaleCorrUnc", &phoScaleCorrUnc, &b_phoScaleCorrUnc);
   fChain->SetBranchAddress("phoSmearUnc_nominal", &phoSmearUnc_nominal, &b_phoSmearUnc_nominal);
   fChain->SetBranchAddress("phoSmearUnc_rhoUp", &phoSmearUnc_rhoUp, &b_phoSmearUnc_rhoUp);
   fChain->SetBranchAddress("phoSmearUnc_rhoDown", &phoSmearUnc_rhoDown, &b_phoSmearUnc_rhoDown);
   fChain->SetBranchAddress("phoSmearUnc_phiUp", &phoSmearUnc_phiUp, &b_phoSmearUnc_phiUp);
   fChain->SetBranchAddress("phoSmearUnc_phiDown", &phoSmearUnc_phiDown, &b_phoSmearUnc_phiDown);
   fChain->SetBranchAddress("phoxtalBits", &phoxtalBits, &b_phoxtalBits);
   fChain->SetBranchAddress("phoIDbit", &phoIDbit, &b_phoIDbit);
   fChain->SetBranchAddress("npfPho", &npfPho, &b_npfPho);
   fChain->SetBranchAddress("pfphoEt", &pfphoEt, &b_pfphoEt);
   fChain->SetBranchAddress("pfphoEta", &pfphoEta, &b_pfphoEta);
   fChain->SetBranchAddress("pfphoPhi", &pfphoPhi, &b_pfphoPhi);
   fChain->SetBranchAddress("nEle", &nEle, &b_nEle);
   fChain->SetBranchAddress("eleCharge", &eleCharge, &b_eleCharge);
   fChain->SetBranchAddress("eleChargeConsistent", &eleChargeConsistent, &b_eleChargeConsistent);
   fChain->SetBranchAddress("eleEn", &eleEn, &b_eleEn);
   fChain->SetBranchAddress("eleSCEn", &eleSCEn, &b_eleSCEn);
   fChain->SetBranchAddress("eleESEn", &eleESEn, &b_eleESEn);
   fChain->SetBranchAddress("eleESEnP1", &eleESEnP1, &b_eleESEnP1);
   fChain->SetBranchAddress("eleESEnP2", &eleESEnP2, &b_eleESEnP2);
   fChain->SetBranchAddress("eleD0", &eleD0, &b_eleD0);
   fChain->SetBranchAddress("eleDz", &eleDz, &b_eleDz);
   fChain->SetBranchAddress("eleSIP", &eleSIP, &b_eleSIP);
   fChain->SetBranchAddress("elePt", &elePt, &b_elePt);
   fChain->SetBranchAddress("eleEta", &eleEta, &b_eleEta);
   fChain->SetBranchAddress("elePhi", &elePhi, &b_elePhi);
   fChain->SetBranchAddress("eleR9", &eleR9, &b_eleR9);
   fChain->SetBranchAddress("eleCalibPt", &eleCalibPt, &b_eleCalibPt);
   fChain->SetBranchAddress("eleCalibEn", &eleCalibEn, &b_eleCalibEn);
   fChain->SetBranchAddress("eleScaleSyst", &eleScaleSyst, &b_eleScaleSyst);
   fChain->SetBranchAddress("eleSmearRhoUp", &eleSmearRhoUp, &b_eleSmearRhoUp);
   fChain->SetBranchAddress("eleSmearRhoDo", &eleSmearRhoDo, &b_eleSmearRhoDo);
   fChain->SetBranchAddress("eleSmearPhiUp", &eleSmearPhiUp, &b_eleSmearPhiUp);
   fChain->SetBranchAddress("eleSmearPhiDo", &eleSmearPhiDo, &b_eleSmearPhiDo);
   fChain->SetBranchAddress("eleSCEta", &eleSCEta, &b_eleSCEta);
   fChain->SetBranchAddress("eleSCPhi", &eleSCPhi, &b_eleSCPhi);
   fChain->SetBranchAddress("eleSCRawEn", &eleSCRawEn, &b_eleSCRawEn);
   fChain->SetBranchAddress("eleSCEtaWidth", &eleSCEtaWidth, &b_eleSCEtaWidth);
   fChain->SetBranchAddress("eleSCPhiWidth", &eleSCPhiWidth, &b_eleSCPhiWidth);
   fChain->SetBranchAddress("eleHoverE", &eleHoverE, &b_eleHoverE);
   fChain->SetBranchAddress("eleEoverP", &eleEoverP, &b_eleEoverP);
   fChain->SetBranchAddress("eleEoverPout", &eleEoverPout, &b_eleEoverPout);
   fChain->SetBranchAddress("eleEoverPInv", &eleEoverPInv, &b_eleEoverPInv);
   fChain->SetBranchAddress("eleBrem", &eleBrem, &b_eleBrem);
   fChain->SetBranchAddress("eledEtaAtVtx", &eledEtaAtVtx, &b_eledEtaAtVtx);
   fChain->SetBranchAddress("eledPhiAtVtx", &eledPhiAtVtx, &b_eledPhiAtVtx);
   fChain->SetBranchAddress("eledEtaAtCalo", &eledEtaAtCalo, &b_eledEtaAtCalo);
   fChain->SetBranchAddress("eleSigmaIEtaIEtaFull5x5", &eleSigmaIEtaIEtaFull5x5, &b_eleSigmaIEtaIEtaFull5x5);
   fChain->SetBranchAddress("eleSigmaIPhiIPhiFull5x5", &eleSigmaIPhiIPhiFull5x5, &b_eleSigmaIPhiIPhiFull5x5);
   fChain->SetBranchAddress("eleConvVeto", &eleConvVeto, &b_eleConvVeto);
   fChain->SetBranchAddress("eleMissHits", &eleMissHits, &b_eleMissHits);
   fChain->SetBranchAddress("eleESEffSigmaRR", &eleESEffSigmaRR, &b_eleESEffSigmaRR);
   fChain->SetBranchAddress("elePFChIso", &elePFChIso, &b_elePFChIso);
   fChain->SetBranchAddress("elePFPhoIso", &elePFPhoIso, &b_elePFPhoIso);
   fChain->SetBranchAddress("elePFNeuIso", &elePFNeuIso, &b_elePFNeuIso);
   fChain->SetBranchAddress("elePFPUIso", &elePFPUIso, &b_elePFPUIso);
   fChain->SetBranchAddress("elePFClusEcalIso", &elePFClusEcalIso, &b_elePFClusEcalIso);
   fChain->SetBranchAddress("elePFClusHcalIso", &elePFClusHcalIso, &b_elePFClusHcalIso);
   fChain->SetBranchAddress("elePFMiniIso", &elePFMiniIso, &b_elePFMiniIso);
   fChain->SetBranchAddress("eleIDMVA", &eleIDMVA, &b_eleIDMVA);
   fChain->SetBranchAddress("eleIDMVAHZZ", &eleIDMVAHZZ, &b_eleIDMVAHZZ);
   fChain->SetBranchAddress("eledEtaseedAtVtx", &eledEtaseedAtVtx, &b_eledEtaseedAtVtx);
   fChain->SetBranchAddress("eleE1x5", &eleE1x5, &b_eleE1x5);
   fChain->SetBranchAddress("eleE2x5", &eleE2x5, &b_eleE2x5);
   fChain->SetBranchAddress("eleE5x5", &eleE5x5, &b_eleE5x5);
   fChain->SetBranchAddress("eleE1x5Full5x5", &eleE1x5Full5x5, &b_eleE1x5Full5x5);
   fChain->SetBranchAddress("eleE2x5Full5x5", &eleE2x5Full5x5, &b_eleE2x5Full5x5);
   fChain->SetBranchAddress("eleE5x5Full5x5", &eleE5x5Full5x5, &b_eleE5x5Full5x5);
   fChain->SetBranchAddress("eleR9Full5x5", &eleR9Full5x5, &b_eleR9Full5x5);
   fChain->SetBranchAddress("eleEcalDrivenSeed", &eleEcalDrivenSeed, &b_eleEcalDrivenSeed);
   fChain->SetBranchAddress("eleDr03EcalRecHitSumEt", &eleDr03EcalRecHitSumEt, &b_eleDr03EcalRecHitSumEt);
   fChain->SetBranchAddress("eleDr03HcalDepth1TowerSumEt", &eleDr03HcalDepth1TowerSumEt, &b_eleDr03HcalDepth1TowerSumEt);
   fChain->SetBranchAddress("eleDr03HcalDepth2TowerSumEt", &eleDr03HcalDepth2TowerSumEt, &b_eleDr03HcalDepth2TowerSumEt);
   fChain->SetBranchAddress("eleDr03HcalTowerSumEt", &eleDr03HcalTowerSumEt, &b_eleDr03HcalTowerSumEt);
   fChain->SetBranchAddress("eleDr03TkSumPt", &eleDr03TkSumPt, &b_eleDr03TkSumPt);
   fChain->SetBranchAddress("elecaloEnergy", &elecaloEnergy, &b_elecaloEnergy);
   fChain->SetBranchAddress("eleTrkdxy", &eleTrkdxy, &b_eleTrkdxy);
   fChain->SetBranchAddress("eleKFHits", &eleKFHits, &b_eleKFHits);
   fChain->SetBranchAddress("eleKFChi2", &eleKFChi2, &b_eleKFChi2);
   fChain->SetBranchAddress("eleGSFChi2", &eleGSFChi2, &b_eleGSFChi2);
   fChain->SetBranchAddress("eleGSFPt", &eleGSFPt, &b_eleGSFPt);
   fChain->SetBranchAddress("eleGSFEta", &eleGSFEta, &b_eleGSFEta);
   fChain->SetBranchAddress("eleGSFPhi", &eleGSFPhi, &b_eleGSFPhi);
   fChain->SetBranchAddress("eleGSFCharge", &eleGSFCharge, &b_eleGSFCharge);
   fChain->SetBranchAddress("eleGSFHits", &eleGSFHits, &b_eleGSFHits);
   fChain->SetBranchAddress("eleGSFMissHits", &eleGSFMissHits, &b_eleGSFMissHits);
   fChain->SetBranchAddress("eleGSFNHitsMax", &eleGSFNHitsMax, &b_eleGSFNHitsMax);
   fChain->SetBranchAddress("eleGSFVtxProb", &eleGSFVtxProb, &b_eleGSFVtxProb);
   fChain->SetBranchAddress("eleGSFlxyPV", &eleGSFlxyPV, &b_eleGSFlxyPV);
   fChain->SetBranchAddress("eleGSFlxyBS", &eleGSFlxyBS, &b_eleGSFlxyBS);
   fChain->SetBranchAddress("eleBCEn", &eleBCEn, &b_eleBCEn);
   fChain->SetBranchAddress("eleBCEta", &eleBCEta, &b_eleBCEta);
   fChain->SetBranchAddress("eleBCPhi", &eleBCPhi, &b_eleBCPhi);
   fChain->SetBranchAddress("eleBCS25", &eleBCS25, &b_eleBCS25);
   fChain->SetBranchAddress("eleBCS15", &eleBCS15, &b_eleBCS15);
   fChain->SetBranchAddress("eleBCSieie", &eleBCSieie, &b_eleBCSieie);
   fChain->SetBranchAddress("eleBCSieip", &eleBCSieip, &b_eleBCSieip);
   fChain->SetBranchAddress("eleBCSipip", &eleBCSipip, &b_eleBCSipip);
   fChain->SetBranchAddress("eleFiredSingleTrgs", &eleFiredSingleTrgs, &b_eleFiredSingleTrgs);
   fChain->SetBranchAddress("eleFiredDoubleTrgs", &eleFiredDoubleTrgs, &b_eleFiredDoubleTrgs);
   fChain->SetBranchAddress("eleFiredL1Trgs", &eleFiredL1Trgs, &b_eleFiredL1Trgs);
   fChain->SetBranchAddress("eleIDbit", &eleIDbit, &b_eleIDbit);
   fChain->SetBranchAddress("npfHF", &npfHF, &b_npfHF);
   fChain->SetBranchAddress("pfHFEn", &pfHFEn, &b_pfHFEn);
   fChain->SetBranchAddress("pfHFECALEn", &pfHFECALEn, &b_pfHFECALEn);
   fChain->SetBranchAddress("pfHFHCALEn", &pfHFHCALEn, &b_pfHFHCALEn);
   fChain->SetBranchAddress("pfHFPt", &pfHFPt, &b_pfHFPt);
   fChain->SetBranchAddress("pfHFEta", &pfHFEta, &b_pfHFEta);
   fChain->SetBranchAddress("pfHFPhi", &pfHFPhi, &b_pfHFPhi);
   fChain->SetBranchAddress("pfHFIso", &pfHFIso, &b_pfHFIso);
   fChain->SetBranchAddress("nMu", &nMu, &b_nMu);
   fChain->SetBranchAddress("muPt", &muPt, &b_muPt);
   fChain->SetBranchAddress("muEn", &muEn, &b_muEn);
   fChain->SetBranchAddress("muEta", &muEta, &b_muEta);
   fChain->SetBranchAddress("muPhi", &muPhi, &b_muPhi);
   fChain->SetBranchAddress("muCharge", &muCharge, &b_muCharge);
   fChain->SetBranchAddress("muType", &muType, &b_muType);
   fChain->SetBranchAddress("muIDbit", &muIDbit, &b_muIDbit);
   fChain->SetBranchAddress("muD0", &muD0, &b_muD0);
   fChain->SetBranchAddress("muDz", &muDz, &b_muDz);
   fChain->SetBranchAddress("muSIP", &muSIP, &b_muSIP);
   fChain->SetBranchAddress("muChi2NDF", &muChi2NDF, &b_muChi2NDF);
   fChain->SetBranchAddress("muInnerD0", &muInnerD0, &b_muInnerD0);
   fChain->SetBranchAddress("muInnerDz", &muInnerDz, &b_muInnerDz);
   fChain->SetBranchAddress("muTrkLayers", &muTrkLayers, &b_muTrkLayers);
   fChain->SetBranchAddress("muPixelLayers", &muPixelLayers, &b_muPixelLayers);
   fChain->SetBranchAddress("muPixelHits", &muPixelHits, &b_muPixelHits);
   fChain->SetBranchAddress("muMuonHits", &muMuonHits, &b_muMuonHits);
   fChain->SetBranchAddress("muStations", &muStations, &b_muStations);
   fChain->SetBranchAddress("muMatches", &muMatches, &b_muMatches);
   fChain->SetBranchAddress("muTrkQuality", &muTrkQuality, &b_muTrkQuality);
   fChain->SetBranchAddress("muIsoTrk", &muIsoTrk, &b_muIsoTrk);
   fChain->SetBranchAddress("muPFChIso", &muPFChIso, &b_muPFChIso);
   fChain->SetBranchAddress("muPFPhoIso", &muPFPhoIso, &b_muPFPhoIso);
   fChain->SetBranchAddress("muPFNeuIso", &muPFNeuIso, &b_muPFNeuIso);
   fChain->SetBranchAddress("muPFPUIso", &muPFPUIso, &b_muPFPUIso);
   fChain->SetBranchAddress("muPFMiniIso", &muPFMiniIso, &b_muPFMiniIso);
   fChain->SetBranchAddress("muFiredTrgs", &muFiredTrgs, &b_muFiredTrgs);
   fChain->SetBranchAddress("muFiredL1Trgs", &muFiredL1Trgs, &b_muFiredL1Trgs);
   fChain->SetBranchAddress("muInnervalidFraction", &muInnervalidFraction, &b_muInnervalidFraction);
   fChain->SetBranchAddress("musegmentCompatibility", &musegmentCompatibility, &b_musegmentCompatibility);
   fChain->SetBranchAddress("muchi2LocalPosition", &muchi2LocalPosition, &b_muchi2LocalPosition);
   fChain->SetBranchAddress("mutrkKink", &mutrkKink, &b_mutrkKink);
   fChain->SetBranchAddress("muBestTrkPtError", &muBestTrkPtError, &b_muBestTrkPtError);
   fChain->SetBranchAddress("muBestTrkPt", &muBestTrkPt, &b_muBestTrkPt);
   fChain->SetBranchAddress("nJet", &nJet, &b_nJet);
   fChain->SetBranchAddress("jetPt", &jetPt, &b_jetPt);
   fChain->SetBranchAddress("jetEn", &jetEn, &b_jetEn);
   fChain->SetBranchAddress("jetEta", &jetEta, &b_jetEta);
   fChain->SetBranchAddress("jetPhi", &jetPhi, &b_jetPhi);
   fChain->SetBranchAddress("jetRawPt", &jetRawPt, &b_jetRawPt);
   fChain->SetBranchAddress("jetRawEn", &jetRawEn, &b_jetRawEn);
   fChain->SetBranchAddress("jetMt", &jetMt, &b_jetMt);
   fChain->SetBranchAddress("jetArea", &jetArea, &b_jetArea);
   fChain->SetBranchAddress("jetMass", &jetMass, &b_jetMass);
   fChain->SetBranchAddress("jetPx", &jetPx, &b_jetPx);
   fChain->SetBranchAddress("jetPy", &jetPy, &b_jetPy);
   fChain->SetBranchAddress("jetPz", &jetPz, &b_jetPz);
   fChain->SetBranchAddress("jetLeadTrackPt", &jetLeadTrackPt, &b_jetLeadTrackPt);
   fChain->SetBranchAddress("jetLeadTrackEta", &jetLeadTrackEta, &b_jetLeadTrackEta);
   fChain->SetBranchAddress("jetLeadTrackPhi", &jetLeadTrackPhi, &b_jetLeadTrackPhi);
   fChain->SetBranchAddress("jetLepTrackPID", &jetLepTrackPID, &b_jetLepTrackPID);
   fChain->SetBranchAddress("jetLepTrackPt", &jetLepTrackPt, &b_jetLepTrackPt);
   fChain->SetBranchAddress("jetLepTrackEta", &jetLepTrackEta, &b_jetLepTrackEta);
   fChain->SetBranchAddress("jetLepTrackPhi", &jetLepTrackPhi, &b_jetLepTrackPhi);
   fChain->SetBranchAddress("jetCSV2BJetTags", &jetCSV2BJetTags, &b_jetCSV2BJetTags);
   fChain->SetBranchAddress("jetJetProbabilityBJetTags", &jetJetProbabilityBJetTags, &b_jetJetProbabilityBJetTags);
   fChain->SetBranchAddress("jetpfCombinedMVAV2BJetTags", &jetpfCombinedMVAV2BJetTags, &b_jetpfCombinedMVAV2BJetTags);
   fChain->SetBranchAddress("jetPartonID", &jetPartonID, &b_jetPartonID);
   fChain->SetBranchAddress("jetHadFlvr", &jetHadFlvr, &b_jetHadFlvr);
   fChain->SetBranchAddress("jetGenJetEn", &jetGenJetEn, &b_jetGenJetEn);
   fChain->SetBranchAddress("jetGenJetPt", &jetGenJetPt, &b_jetGenJetPt);
   fChain->SetBranchAddress("jetGenJetEta", &jetGenJetEta, &b_jetGenJetEta);
   fChain->SetBranchAddress("jetGenJetPhi", &jetGenJetPhi, &b_jetGenJetPhi);
   fChain->SetBranchAddress("jetGenPartonID", &jetGenPartonID, &b_jetGenPartonID);
   fChain->SetBranchAddress("jetGenEn", &jetGenEn, &b_jetGenEn);
   fChain->SetBranchAddress("jetGenPt", &jetGenPt, &b_jetGenPt);
   fChain->SetBranchAddress("jetGenEta", &jetGenEta, &b_jetGenEta);
   fChain->SetBranchAddress("jetGenPhi", &jetGenPhi, &b_jetGenPhi);
   fChain->SetBranchAddress("jetGenPartonMomID", &jetGenPartonMomID, &b_jetGenPartonMomID);
   fChain->SetBranchAddress("jetP4Smear", &jetP4Smear, &b_jetP4Smear);
   fChain->SetBranchAddress("jetP4SmearUp", &jetP4SmearUp, &b_jetP4SmearUp);
   fChain->SetBranchAddress("jetP4SmearDo", &jetP4SmearDo, &b_jetP4SmearDo);
   fChain->SetBranchAddress("jetPFLooseId", &jetPFLooseId, &b_jetPFLooseId);
   fChain->SetBranchAddress("jetID", &jetID, &b_jetID);
   fChain->SetBranchAddress("jetPUID", &jetPUID, &b_jetPUID);
   fChain->SetBranchAddress("jetJECUnc", &jetJECUnc, &b_jetJECUnc);
   fChain->SetBranchAddress("jetJERSmearing", &jetJERSmearing, &b_jetJERSmearing);
   fChain->SetBranchAddress("jetJERSmearingUp", &jetJERSmearingUp, &b_jetJERSmearingUp);
   fChain->SetBranchAddress("jetJERSmearingDown", &jetJERSmearingDown, &b_jetJERSmearingDown);
   fChain->SetBranchAddress("jetFiredTrgs", &jetFiredTrgs, &b_jetFiredTrgs);
   fChain->SetBranchAddress("jetCHF", &jetCHF, &b_jetCHF);
   fChain->SetBranchAddress("jetNHF", &jetNHF, &b_jetNHF);
   fChain->SetBranchAddress("jetCEF", &jetCEF, &b_jetCEF);
   fChain->SetBranchAddress("jetNEF", &jetNEF, &b_jetNEF);
   fChain->SetBranchAddress("jetNCH", &jetNCH, &b_jetNCH);
   fChain->SetBranchAddress("jetNNP", &jetNNP, &b_jetNNP);
   fChain->SetBranchAddress("jetMUF", &jetMUF, &b_jetMUF);
   fChain->SetBranchAddress("jetVtxPt", &jetVtxPt, &b_jetVtxPt);
   fChain->SetBranchAddress("jetVtxMass", &jetVtxMass, &b_jetVtxMass);
   fChain->SetBranchAddress("jetVtxNtrks", &jetVtxNtrks, &b_jetVtxNtrks);
   fChain->SetBranchAddress("jetVtx3DVal", &jetVtx3DVal, &b_jetVtx3DVal);
   fChain->SetBranchAddress("jetVtx3DSig", &jetVtx3DSig, &b_jetVtx3DSig);
   fChain->SetBranchAddress("jetHFHAE", &jetHFHAE, &b_jetHFHAE);
   fChain->SetBranchAddress("jetHFEME", &jetHFEME, &b_jetHFEME);
   fChain->SetBranchAddress("jetNConstituents", &jetNConstituents, &b_jetNConstituents);
   fChain->SetBranchAddress("nAK8Jet", &nAK8Jet, &b_nAK8Jet);
   fChain->SetBranchAddress("AK8JetPt", &AK8JetPt, &b_AK8JetPt);
   fChain->SetBranchAddress("AK8JetEn", &AK8JetEn, &b_AK8JetEn);
   fChain->SetBranchAddress("AK8JetRawPt", &AK8JetRawPt, &b_AK8JetRawPt);
   fChain->SetBranchAddress("AK8JetRawEn", &AK8JetRawEn, &b_AK8JetRawEn);
   fChain->SetBranchAddress("AK8JetEta", &AK8JetEta, &b_AK8JetEta);
   fChain->SetBranchAddress("AK8JetPhi", &AK8JetPhi, &b_AK8JetPhi);
   fChain->SetBranchAddress("AK8JetMass", &AK8JetMass, &b_AK8JetMass);
   fChain->SetBranchAddress("AK8Jet_tau1", &AK8Jet_tau1, &b_AK8Jet_tau1);
   fChain->SetBranchAddress("AK8Jet_tau2", &AK8Jet_tau2, &b_AK8Jet_tau2);
   fChain->SetBranchAddress("AK8Jet_tau3", &AK8Jet_tau3, &b_AK8Jet_tau3);
   fChain->SetBranchAddress("AK8JetCHF", &AK8JetCHF, &b_AK8JetCHF);
   fChain->SetBranchAddress("AK8JetNHF", &AK8JetNHF, &b_AK8JetNHF);
   fChain->SetBranchAddress("AK8JetCEF", &AK8JetCEF, &b_AK8JetCEF);
   fChain->SetBranchAddress("AK8JetNEF", &AK8JetNEF, &b_AK8JetNEF);
   fChain->SetBranchAddress("AK8JetNCH", &AK8JetNCH, &b_AK8JetNCH);
   fChain->SetBranchAddress("AK8JetNNP", &AK8JetNNP, &b_AK8JetNNP);
   fChain->SetBranchAddress("AK8JetMUF", &AK8JetMUF, &b_AK8JetMUF);
   fChain->SetBranchAddress("AK8Jetnconstituents", &AK8Jetnconstituents, &b_AK8Jetnconstituents);
   fChain->SetBranchAddress("AK8JetPFLooseId", &AK8JetPFLooseId, &b_AK8JetPFLooseId);
   fChain->SetBranchAddress("AK8JetPFTightLepVetoId", &AK8JetPFTightLepVetoId, &b_AK8JetPFTightLepVetoId);
   fChain->SetBranchAddress("AK8JetSoftDropMass", &AK8JetSoftDropMass, &b_AK8JetSoftDropMass);
   fChain->SetBranchAddress("AK8JetSoftDropMassCorr", &AK8JetSoftDropMassCorr, &b_AK8JetSoftDropMassCorr);
   fChain->SetBranchAddress("AK8JetPrunedMass", &AK8JetPrunedMass, &b_AK8JetPrunedMass);
   fChain->SetBranchAddress("AK8JetPrunedMassCorr", &AK8JetPrunedMassCorr, &b_AK8JetPrunedMassCorr);
   fChain->SetBranchAddress("AK8JetpfBoostedDSVBTag", &AK8JetpfBoostedDSVBTag, &b_AK8JetpfBoostedDSVBTag);
   fChain->SetBranchAddress("AK8JetDSVnewV4", &AK8JetDSVnewV4, &b_AK8JetDSVnewV4);
   fChain->SetBranchAddress("AK8JetCSV", &AK8JetCSV, &b_AK8JetCSV);
   fChain->SetBranchAddress("AK8JetJECUnc", &AK8JetJECUnc, &b_AK8JetJECUnc);
   fChain->SetBranchAddress("AK8JetL2L3corr", &AK8JetL2L3corr, &b_AK8JetL2L3corr);
   fChain->SetBranchAddress("AK8puppiPt", &AK8puppiPt, &b_AK8puppiPt);
   fChain->SetBranchAddress("AK8puppiMass", &AK8puppiMass, &b_AK8puppiMass);
   fChain->SetBranchAddress("AK8puppiEta", &AK8puppiEta, &b_AK8puppiEta);
   fChain->SetBranchAddress("AK8puppiPhi", &AK8puppiPhi, &b_AK8puppiPhi);
   fChain->SetBranchAddress("AK8puppiTau1", &AK8puppiTau1, &b_AK8puppiTau1);
   fChain->SetBranchAddress("AK8puppiTau2", &AK8puppiTau2, &b_AK8puppiTau2);
   fChain->SetBranchAddress("AK8puppiTau3", &AK8puppiTau3, &b_AK8puppiTau3);
   fChain->SetBranchAddress("AK8puppiSDL2L3corr", &AK8puppiSDL2L3corr, &b_AK8puppiSDL2L3corr);
   fChain->SetBranchAddress("AK8puppiSDMass", &AK8puppiSDMass, &b_AK8puppiSDMass);
   fChain->SetBranchAddress("AK8puppiSDMassL2L3Corr", &AK8puppiSDMassL2L3Corr, &b_AK8puppiSDMassL2L3Corr);
   fChain->SetBranchAddress("AK8JetPartonID", &AK8JetPartonID, &b_AK8JetPartonID);
   fChain->SetBranchAddress("AK8JetHadFlvr", &AK8JetHadFlvr, &b_AK8JetHadFlvr);
   fChain->SetBranchAddress("AK8JetGenJetIndex", &AK8JetGenJetIndex, &b_AK8JetGenJetIndex);
   fChain->SetBranchAddress("AK8JetGenJetEn", &AK8JetGenJetEn, &b_AK8JetGenJetEn);
   fChain->SetBranchAddress("AK8JetGenJetPt", &AK8JetGenJetPt, &b_AK8JetGenJetPt);
   fChain->SetBranchAddress("AK8JetGenJetEta", &AK8JetGenJetEta, &b_AK8JetGenJetEta);
   fChain->SetBranchAddress("AK8JetGenJetPhi", &AK8JetGenJetPhi, &b_AK8JetGenJetPhi);
   fChain->SetBranchAddress("AK8JetGenPartonID", &AK8JetGenPartonID, &b_AK8JetGenPartonID);
   fChain->SetBranchAddress("AK8JetGenEn", &AK8JetGenEn, &b_AK8JetGenEn);
   fChain->SetBranchAddress("AK8JetGenPt", &AK8JetGenPt, &b_AK8JetGenPt);
   fChain->SetBranchAddress("AK8JetGenEta", &AK8JetGenEta, &b_AK8JetGenEta);
   fChain->SetBranchAddress("AK8JetGenPhi", &AK8JetGenPhi, &b_AK8JetGenPhi);
   fChain->SetBranchAddress("AK8JetGenPartonMomID", &AK8JetGenPartonMomID, &b_AK8JetGenPartonMomID);
   fChain->SetBranchAddress("AK8JetP4Smear", &AK8JetP4Smear, &b_AK8JetP4Smear);
   fChain->SetBranchAddress("AK8JetP4SmearUp", &AK8JetP4SmearUp, &b_AK8JetP4SmearUp);
   fChain->SetBranchAddress("AK8JetP4SmearDo", &AK8JetP4SmearDo, &b_AK8JetP4SmearDo);
   fChain->SetBranchAddress("nAK8SDSJ", &nAK8SDSJ, &b_nAK8SDSJ);
   fChain->SetBranchAddress("AK8SDSJPt", &AK8SDSJPt, &b_AK8SDSJPt);
   fChain->SetBranchAddress("AK8SDSJEta", &AK8SDSJEta, &b_AK8SDSJEta);
   fChain->SetBranchAddress("AK8SDSJPhi", &AK8SDSJPhi, &b_AK8SDSJPhi);
   fChain->SetBranchAddress("AK8SDSJMass", &AK8SDSJMass, &b_AK8SDSJMass);
   fChain->SetBranchAddress("AK8SDSJE", &AK8SDSJE, &b_AK8SDSJE);
   fChain->SetBranchAddress("AK8SDSJCharge", &AK8SDSJCharge, &b_AK8SDSJCharge);
   fChain->SetBranchAddress("AK8SDSJFlavour", &AK8SDSJFlavour, &b_AK8SDSJFlavour);
   fChain->SetBranchAddress("AK8SDSJCSV", &AK8SDSJCSV, &b_AK8SDSJCSV);
   fChain->SetBranchAddress("nAK8puppiSDSJ", &nAK8puppiSDSJ, &b_nAK8puppiSDSJ);
   fChain->SetBranchAddress("AK8puppiSDSJPt", &AK8puppiSDSJPt, &b_AK8puppiSDSJPt);
   fChain->SetBranchAddress("AK8puppiSDSJEta", &AK8puppiSDSJEta, &b_AK8puppiSDSJEta);
   fChain->SetBranchAddress("AK8puppiSDSJPhi", &AK8puppiSDSJPhi, &b_AK8puppiSDSJPhi);
   fChain->SetBranchAddress("AK8puppiSDSJMass", &AK8puppiSDSJMass, &b_AK8puppiSDSJMass);
   fChain->SetBranchAddress("AK8puppiSDSJE", &AK8puppiSDSJE, &b_AK8puppiSDSJE);
   fChain->SetBranchAddress("AK8puppiSDSJCharge", &AK8puppiSDSJCharge, &b_AK8puppiSDSJCharge);
   fChain->SetBranchAddress("AK8puppiSDSJFlavour", &AK8puppiSDSJFlavour, &b_AK8puppiSDSJFlavour);
   fChain->SetBranchAddress("AK8puppiSDSJCSV", &AK8puppiSDSJCSV, &b_AK8puppiSDSJCSV);
   Notify();
}

Bool_t PostAnalyzer_MC::Notify()
{
   // The Notify() function is called when a new file is opened. This
   // can be either for a new TTree in a TChain or when when a new TTree
   // is started when using PROOF. It is normally not necessary to make changes
   // to the generated code, but the routine can be extended by the
   // user if needed. The return value is currently not used.

   return kTRUE;
}

void PostAnalyzer_MC::Show(Long64_t entry)
{
// Print contents of entry.
// If entry is not specified, print current entry
   if (!fChain) return;
   fChain->Show(entry);
}
Int_t PostAnalyzer_MC::Cut(Long64_t entry)
{
// This function may be called from Loop.
// returns  1 if entry is accepted.
// returns -1 otherwise.
   return 1;
}

/*
Bool_t PostAnalyzer_MC::GoodPrimaryVtx(Int_t &GoodVertex){

  Bool_t passVtx = false;
  GoodVertex = 0;

  for(Int_t i=0; i < nVtx; ++i){
    if( (fabs((*vtz)[i])) <= Cut_Vtx_z &&
        (*vndof)[i] >= Cut_Vtx_ndof    &&
        !((*isFake)[i])                &&
        (fabs((*vrho)[i])) <= Cut_Vtx_rho )
      GoodVertex++;
  }
  if(GoodVertex > 0) passVtx = true;

  return passVtx;

}
*/

//Cut Based Ph ID for 13 TeV 2016data(https://twiki.cern.ch/twiki/bin/viewauth/CMS/CutBasedPhotonIdentificationRun2#Recommended_Working_points_for_2)
//Latest ID for full 2016 Rereco data (Spring16 selection)
Bool_t PostAnalyzer_MC::CutBasedPhotonID(Int_t ipho, TString phoWP){

  Bool_t PhID = false;

  if(phoWP == "loose"){ //loose 
    if((fabs((*phoSCEta)[ipho])) <= 1.4442){ //Barrel

      PhID = ((*phoEleVeto)[ipho] == 1)                 &&
	((*phoHoverE)[ipho] < 0.0597)                   &&
	((*phoSigmaIEtaIEtaFull5x5)[ipho] < 0.01031)    &&
        ((TMath::Max(((*phoPFChIso)[ipho] - rho*EAChargedHadrons((*phoSCEta)[ipho])), 0.0)) < 1.295)                    &&
	((TMath::Max(((*phoPFNeuIso)[ipho] - rho*EANeutralHadrons((*phoSCEta)[ipho])), 0.0)) < 10.910 + 0.0148*(*phoEt)[ipho] + 0.000017*(*phoEt)[ipho]*(*phoEt)[ipho])                                      &&
        ((TMath::Max(((*phoPFPhoIso)[ipho] - rho*EAPhotons((*phoSCEta)[ipho])), 0.0)) < 3.630+0.0047*(*phoEt)[ipho]);

    }
    if((fabs((*phoSCEta)[ipho])) > 1.4442){ //Endcap

      PhID = ((*phoEleVeto)[ipho] == 1)                 &&
      ((*phoHoverE)[ipho] < 0.0481)                     &&
      ((*phoSigmaIEtaIEtaFull5x5)[ipho] < 0.03013)      &&
      ((TMath::Max(((*phoPFChIso)[ipho] - rho*EAChargedHadrons((*phoSCEta)[ipho])), 0.0)) < 1.011)                      &&
      ((TMath::Max(((*phoPFNeuIso)[ipho] - rho*EANeutralHadrons((*phoSCEta)[ipho])), 0.0)) < 5.931 + 0.0163*(*phoEt)[ipho] + 0.000014*(*phoEt)[ipho]*(*phoEt)[ipho])                                         &&
      ((TMath::Max(((*phoPFPhoIso)[ipho] - rho*EAPhotons((*phoSCEta)[ipho])), 0.0)) < 6.641 + 0.0034*(*phoEt)[ipho]);

    }
  }
  if(phoWP == "medium"){ //medium
    if((fabs((*phoSCEta)[ipho])) <= 1.4442){ //Barrel

      PhID = ((*phoEleVeto)[ipho] == 1)                 &&
	((*phoHoverE)[ipho] < 0.0396)                   &&
	((*phoSigmaIEtaIEtaFull5x5)[ipho] < 0.01022)    &&
        ((TMath::Max(((*phoPFChIso)[ipho] - rho*EAChargedHadrons((*phoSCEta)[ipho])), 0.0)) < 0.441)                    &&
	((TMath::Max(((*phoPFNeuIso)[ipho] - rho*EANeutralHadrons((*phoSCEta)[ipho])), 0.0)) < 2.725 + 0.0148*(*phoEt)[ipho] + 0.000017*(*phoEt)[ipho]*(*phoEt)[ipho])                                       &&
	((TMath::Max(((*phoPFPhoIso)[ipho] - rho*EAPhotons((*phoSCEta)[ipho])), 0.0)) < 2.571 + 0.0047*(*phoEt)[ipho]);

    }
    if((fabs((*phoSCEta)[ipho])) > 1.4442){ //Endcap

      PhID = ((*phoEleVeto)[ipho] == 1)                 &&
      ((*phoHoverE)[ipho] < 0.0219)                     &&
      ((*phoSigmaIEtaIEtaFull5x5)[ipho] < 0.03001)      &&
      ((TMath::Max(((*phoPFChIso)[ipho] - rho*EAChargedHadrons((*phoSCEta)[ipho])), 0.0)) < 0.442)                      &&
      ((TMath::Max(((*phoPFNeuIso)[ipho] - rho*EANeutralHadrons((*phoSCEta)[ipho])), 0.0)) < 1.715 + 0.0163*(*phoEt)[ipho] + 0.000014*(*phoEt)[ipho]*(*phoEt)[ipho])                                         &&
      ((TMath::Max(((*phoPFPhoIso)[ipho] - rho*EAPhotons((*phoSCEta)[ipho])), 0.0)) < 3.863 + 0.0034*(*phoEt)[ipho]);

    }
  }        
  if(phoWP == "tight"){ //tight
    if((fabs((*phoSCEta)[ipho])) <= 1.4442){ //Barrel

      PhID = ((*phoEleVeto)[ipho] == 1)                 &&
	((*phoHoverE)[ipho] < 0.0269)                   &&
	((*phoSigmaIEtaIEtaFull5x5)[ipho] < 0.00994)    &&
        ((TMath::Max(((*phoPFChIso)[ipho] - rho*EAChargedHadrons((*phoSCEta)[ipho])), 0.0)) < 0.202)                    &&
	((TMath::Max(((*phoPFNeuIso)[ipho] - rho*EANeutralHadrons((*phoSCEta)[ipho])), 0.0)) < 0.264 + 0.0148*(*phoEt)[ipho] + 0.000017*(*phoEt)[ipho]*(*phoEt)[ipho])                                          &&
        ((TMath::Max(((*phoPFPhoIso)[ipho] - rho*EAPhotons((*phoSCEta)[ipho])), 0.0)) < 2.362 + 0.0047*(*phoEt)[ipho]);

    }
    if((fabs((*phoSCEta)[ipho])) > 1.4442){ //Endcap

      PhID = ((*phoEleVeto)[ipho] == 1)                 &&
      ((*phoHoverE)[ipho] < 0.0213)                     &&
      ((*phoSigmaIEtaIEtaFull5x5)[ipho] < 0.03000)      &&
      ((TMath::Max(((*phoPFChIso)[ipho] - rho*EAChargedHadrons((*phoSCEta)[ipho])), 0.0)) < 0.034)                      &&
      ((TMath::Max(((*phoPFNeuIso)[ipho] - rho*EANeutralHadrons((*phoSCEta)[ipho])), 0.0)) < 0.586 + 0.0163*(*phoEt)[ipho] + 0.000014*(*phoEt)[ipho]*(*phoEt)[ipho])                                           &&
      ((TMath::Max(((*phoPFPhoIso)[ipho] - rho*EAPhotons((*phoSCEta)[ipho])), 0.0)) < 2.617 + 0.0034*(*phoEt)[ipho]);

    }
  }
  return PhID;
}

//(https://twiki.cern.ch/twiki/bin/viewauth/CMS/CutBasedPhotonIdentificationRun2#Selection implementation details for SPRING16)
Double_t PostAnalyzer_MC::EAChargedHadrons(Double_t eta){

  Double_t EffArea = 0;

  if( fabs(eta) >= 0.0   && fabs(eta) < 1.0   ) EffArea = 0.0360;
  if( fabs(eta) >= 1.0   && fabs(eta) < 1.479 ) EffArea = 0.0377;
  if( fabs(eta) >= 1.479 && fabs(eta) < 2.0   ) EffArea = 0.0306;
  if( fabs(eta) >= 2.0   && fabs(eta) < 2.2   ) EffArea = 0.0283;
  if( fabs(eta) >= 2.2   && fabs(eta) < 2.3   ) EffArea = 0.0254;
  if( fabs(eta) >= 2.3   && fabs(eta) < 2.4   ) EffArea = 0.0217;
  if( fabs(eta) >= 2.4                        ) EffArea = 0.0167;

  return EffArea;

}

Double_t PostAnalyzer_MC::EANeutralHadrons(Double_t eta){

  Double_t EffArea = 0;

  if( fabs(eta) >= 0.0   && fabs(eta) < 1.0   ) EffArea = 0.0597;
  if( fabs(eta) >= 1.0   && fabs(eta) < 1.479 ) EffArea = 0.0807;
  if( fabs(eta) >= 1.479 && fabs(eta) < 2.0   ) EffArea = 0.0629;
  if( fabs(eta) >= 2.0   && fabs(eta) < 2.2   ) EffArea = 0.0197;
  if( fabs(eta) >= 2.2   && fabs(eta) < 2.3   ) EffArea = 0.0184;
  if( fabs(eta) >= 2.3   && fabs(eta) < 2.4   ) EffArea = 0.0284;
  if( fabs(eta) >= 2.4                        ) EffArea = 0.0591;

  return EffArea;

}

Double_t PostAnalyzer_MC::EAPhotons(Double_t eta){

  Double_t EffArea = 0;

  if( fabs(eta) >= 0.0   && fabs(eta) < 1.0   ) EffArea = 0.1210;
  if( fabs(eta) >= 1.0   && fabs(eta) < 1.479 ) EffArea = 0.1107;
  if( fabs(eta) >= 1.479 && fabs(eta) < 2.0   ) EffArea = 0.0699;
  if( fabs(eta) >= 2.0   && fabs(eta) < 2.2   ) EffArea = 0.1056;
  if( fabs(eta) >= 2.2   && fabs(eta) < 2.3   ) EffArea = 0.1457;
  if( fabs(eta) >= 2.3   && fabs(eta) < 2.4   ) EffArea = 0.1719;
  if( fabs(eta) >= 2.4                        ) EffArea = 0.1998;

  return EffArea;

}

Int_t PostAnalyzer_MC::FirstGoodPhoton(TString phoWP){

  Int_t pc = -1;
  Bool_t ID = false;
  for(Int_t i = 0; i < nPho; i++){
    ID = CutBasedPhotonID(i, phoWP);
    if(ID){
      pc = i;
      break;
    }
  }
  return pc;
}

vector<Int_t> PostAnalyzer_MC::GoodPhotons(TString phoWP){

  vector<Int_t> goodphs;
  goodphs.clear();

  for(Int_t i = 0; i < nPho; i++){
    if(CutBasedPhotonID(i, phoWP) && ResSpikes(i) && (*phoEt)[i] > 30.0){
      goodphs.push_back(i);
    }
  }
  return goodphs;
}

Bool_t PostAnalyzer_MC::ResSpikes(Int_t i){
  Bool_t spikes = false;
  if( //fabs((*phoSeedTime)[i]) < 3.0    &&  //time of arrival of ith photon at see crystal                                                      
      (*phoSigmaIEtaIEtaFull5x5)[i] > 0.001   &&
      (*phoSigmaIPhiIPhiFull5x5)[i] > 0.001   &&
      //fabs(GetLICTD(i)) < 5.0               &&   //LICTD is the largest time difference between the seed crystal and the any other crystal          
      (*phoR9Full5x5)[i] < 1.0){
    spikes = true;
  }
  return spikes;
}


//Recommended JetID for 13 TeV 2016 data(https://twiki.cern.ch/twiki/bin/viewauth/CMS/JetID#Recommendations_for_13_TeV_2016)
Bool_t PostAnalyzer_MC::JetId(Int_t iJet, TString jetWP){

  Bool_t JetID = false;

  if(fabs((*jetEta)[iJet]) <= 2.7){
    if(jetWP == "loose"){

      JetID = ((*jetNHF)[iJet] < 0.99 && (*jetNEF)[iJet] < 0.99  && (*jetNConstituents)[iJet] > 1 ) &&
	((fabs((*jetEta)[iJet]) <= 2.4 && (*jetCHF)[iJet] > 0 && (*jetNCH)[iJet] > 0 && (*jetCEF)[iJet] < 0.99) || fabs((*jetEta)[iJet]) > 2.4);
	 
    }
    if(jetWP == "tight"){

      JetID = ((*jetNHF)[iJet] < 0.90 && (*jetNEF)[iJet] < 0.90 && (*jetNConstituents)[iJet] > 1 ) &&
	((fabs((*jetEta)[iJet]) <= 2.4 && (*jetCHF)[iJet] > 0 && (*jetNCH)[iJet] > 0 && (*jetCEF)[iJet] < 0.99) || fabs((*jetEta)[iJet]) > 2.4);

    }  
    if(jetWP == "tightLepVeto"){

      JetID = ((*jetNHF)[iJet] < 0.90 && (*jetNEF)[iJet] < 0.90 && (*jetNConstituents)[iJet] > 1 && (*jetMUF)[iJet] < 0.8) &&
	((fabs((*jetEta)[iJet]) <= 2.4 && (*jetCHF)[iJet] > 0 && (*jetNCH)[iJet] > 0 && (*jetCEF)[iJet] < 0.90) || fabs((*jetEta)[iJet]) > 2.4);

    }
  }

  if(fabs((*jetEta)[iJet]) > 2.7 && fabs((*jetEta)[iJet]) <= 3.0){
    if(jetWP == "loose"){
      JetID = (*jetNEF)[iJet] > 0.01 && (*jetNHF)[iJet] < 0.98 && (*jetNNP)[iJet] > 2;
    }
    if(jetWP == "tight"){
      JetID = (*jetNEF)[iJet] > 0.01 && (*jetNHF)[iJet] < 0.98 && (*jetNNP)[iJet] > 2;
    }
  }
  
  if(fabs((*jetEta)[iJet]) > 3.0){
    if(jetWP == "loose"){
      JetID = (*jetNEF)[iJet] < 0.90 && (*jetNNP)[iJet] > 10;
    }
    if(jetWP == "tight"){
      JetID = (*jetNEF)[iJet] < 0.90 && (*jetNNP)[iJet]> 10;
    }
  }

  return JetID;
} 

Int_t PostAnalyzer_MC::FirstGoodJet(TString jetWP){

  Int_t jc = -1;
  for(Int_t i = 0; i < nJet; i++){
    Bool_t ID = false;
    ID = JetId(i, jetWP);
    if(ID && (*jetPt)[i] > 30.0){
      double minDR = 99.0;
      for(Int_t ph = 0; ph < nPho; ph++){
        if(CutBasedPhotonID(ph, "loose") && ResSpikes(ph) && (*phoEt)[ph] > 30.0){
          double temp_dR = GetdR((*phoSCEta)[ph], (*jetEta)[i], (*phoSCPhi)[ph], (*jetPhi)[i]);
          if(temp_dR < minDR) minDR = temp_dR;
        }
      }
      if(minDR > 0.5 && minDR < 99.0){
	jc = i;
	break;
      }
    }
  }
  return jc;
}

vector<Int_t> PostAnalyzer_MC::GoodJets(TString jetWP){

  vector<Int_t> goodjets;
  goodjets.clear();

  for(Int_t i = 0; i < nJet; i++){
    Bool_t ID = false;
    ID = JetId(i, jetWP);
    if(ID && (*jetPt)[i] > 30.0){
      double minDR = 99.0;
      for(Int_t ph = 0; ph < nPho; ph++){
        if(CutBasedPhotonID(ph, "loose") && ResSpikes(ph) && (*phoEt)[ph] > 30.0){
          double temp_dR = GetdR((*phoSCEta)[ph], (*jetEta)[i], (*phoSCPhi)[ph], (*jetPhi)[i]);
          if(temp_dR < minDR) minDR = temp_dR;
        }
      }
      if(minDR > 0.5 && minDR < 99.0) goodjets.push_back(i);
    }
  }
  return goodjets;
}

//80XReReco recommendations (https://twiki.cern.ch/twiki/bin/viewauth/CMS/BtagRecommendation80XReReco)
Bool_t PostAnalyzer_MC::CSVv2bTag(Int_t ijet, TString WP){

  Bool_t passTag = false;

  if(WP == "L"){ //loose
    if((*jetCSV2BJetTags)[ijet] > 0.5426) passTag = true;
  }
  if(WP == "M"){ //medium
    if((*jetCSV2BJetTags)[ijet] > 0.8484) passTag = true;
  }
  if(WP == "T"){ //tight
    if((*jetCSV2BJetTags)[ijet] > 0.9535) passTag = true;
  }

  return passTag;
}

Double_t PostAnalyzer_MC::CSVv2bTagSF(BTagEntry::OperatingPoint OP, BTagEntry::JetFlavor JF, std::string sys_type, Double_t JetPt, Double_t JetEta){

  BTagCalibration calib("csvv2", "/uscms_data/d3/rocky86/13TeV/PostAnalyzer_2015+2016/PostAnalyzer_80X/PostAnalyzer_MC/PA_Main/BtagSF/CSVv2_Moriond17_B_H.csv");

  float MaxJetPt;
  std::string mes_type;
  MaxJetPt = 1000.0;

  if(JF == BTagEntry::FLAV_B || JF == BTagEntry::FLAV_C) mes_type = "comb";
  if(JF == BTagEntry::FLAV_UDSG) mes_type = "incl";
 
  if(sys_type == "central"){

    BTagCalibrationReader reader(OP,                // operating point (LOOSE, MEDIUM, TIGHT OR RESHAPING) 
				 sys_type.c_str());  // systematics type (central, up, down..)      
    reader.load(calib,      // calibration instance    
		JF,         // btag flavour  
		mes_type.c_str());  // measurement type             

    if(JetPt > MaxJetPt) JetPt = MaxJetPt;
    double jet_scalefactor = reader.eval(JF, JetEta, JetPt);
    return jet_scalefactor;
  }

  if(sys_type == "up" || sys_type == "down"){

    Bool_t DoubleUncertainty = false; 

    BTagCalibrationReader reader(OP, "central");
    BTagCalibrationReader reader_sys(OP, sys_type.c_str()); //for up or down

    reader.load(calib, JF, mes_type.c_str());
    reader_sys.load(calib, JF, mes_type.c_str());

    if(JetPt > MaxJetPt){
      JetPt = MaxJetPt;
      DoubleUncertainty = true;
    }

    double jet_scalefactor = reader.eval(JF, JetEta, JetPt);
    double jet_scalefactor_sys =  reader_sys.eval(JF, JetEta, JetPt);

    if (DoubleUncertainty) {
      jet_scalefactor_sys = 2*(jet_scalefactor_sys - jet_scalefactor) + jet_scalefactor; //It will work properly for both up and down. 
                                                                                         //As jet_SF_sys > jet_SF for Up and < jet_SF for down.
    }

    return jet_scalefactor_sys;
  }

}

//Its been checked that CSVv2bTagSF and CSVv2bTagSF_auto returns the same results.
Double_t PostAnalyzer_MC::CSVv2bTagSF_auto(BTagEntry::OperatingPoint OP, BTagEntry::JetFlavor JF, std::string sys_type, Double_t JetPt, Double_t JetEta){

  BTagCalibration calib("csvv2", "/uscms_data/d3/rocky86/13TeV/PostAnalyzer_2015+2016/PostAnalyzer_80X/PostAnalyzer_MC/PA_Main/BtagSF/CSVv2_Moriond17_B_H.csv");

  BTagCalibrationReader reader(OP,          // operating point (LOOSE, MEDIUM, TIGHT OR RESHAPING) 
			       "central",   // systematics type (central, up, down..)      
			       {"up", "down"});

  std::string mes_type;
  if(JF == BTagEntry::FLAV_B || JF == BTagEntry::FLAV_C) mes_type = "comb";  
  if(JF == BTagEntry::FLAV_UDSG) mes_type = "incl";
  
  reader.load(calib, // calibration instance    
	      JF,     // btag flavour 
	      mes_type.c_str());  // measurement type             

  double jet_scalefactor = reader.eval_auto_bounds("central", JF, JetEta, JetPt);  //eval_auto_bounds takes care of all the double uncert for out of 
  double jet_scalefactor_up = reader.eval_auto_bounds("up", JF, JetEta, JetPt);    // range pt values etc by itself.
  double jet_scalefactor_do = reader.eval_auto_bounds("down",JF, JetEta, JetPt);

  if(sys_type == "central") return jet_scalefactor;
  if(sys_type == "up") return jet_scalefactor_up;
  if(sys_type == "down") return jet_scalefactor_do;

}

Double_t PostAnalyzer_MC::BTagEventWeight(Double_t ScaleFactor, UInt_t nBTags){

  if( nBTags > 1 )
    {
      cout << "Only one leading jet is considered. Hence, the number of b-tags cannot exceed 1." << endl;
    }

  /*                                                                                                                                                 
    ##################################################################                                                                               
    Event weight matrix:                                                                                                                             
    ------------------------------------------------------------------                                                                               
    nBTags\b-tagged jets  |    0        1             2                                                                                             
    ------------------------------------------------------------------                                                                               
      0                   |    1      1-SF      (1-SF1)(1-SF2)                                                                                       
                          |                                                                                                                         
      1                   |    0       SF    SF1(1-SF2)+(1-SF1)SF2                                                                                  
                          |                                                                                                                          
      2                   |    0        0           SF1SF2                                                                                           
    ##################################################################                                                                               
    Here                                                                                                                                             
    nBTags = No. of expected b jets from MC truth information                                                                                        
    b-tagged jets = Actual no. of b tagged jets by the discriminator                                                                                 
  */

  double weight = 0;
  double SF = ScaleFactor;

  for(unsigned int i = 0; i <= 1; ++i)
    {
      if( i != nBTags ) continue;

      weight += pow(SF,i)*pow(1-SF,1-i);
    }

  return weight;
}


Double_t PostAnalyzer_MC::GetdEta(Double_t eta1, Double_t eta2){

  Double_t dEta = fabs(eta1 - eta2);
  return dEta;
}

Double_t PostAnalyzer_MC::GetdPhi(Double_t phi1, Double_t phi2){

  Double_t dphi = (phi1 - phi2);
  Double_t twoPi = 2.0*(TMath::Pi());

  if(dphi < 0) dphi = - dphi;
  if(dphi >= (twoPi - dphi)) dphi = twoPi - dphi;

  return dphi;
}

Double_t PostAnalyzer_MC::GetdR(Double_t eta1, Double_t eta2, Double_t phi1, Double_t phi2){

  Double_t dEta = GetdEta(eta1, eta2);
  Double_t dPhi = GetdPhi(phi1, phi2);

  Double_t dR = 0.0;
  dR = sqrt(dEta*dEta + dPhi*dPhi);

  return dR;
}

//----------------------     
// Compute cosThetaStar                    
//---------------------                                                                                                                             
Double_t PostAnalyzer_MC::GetCosThetaStar(Double_t eta1, Double_t eta2){
  Double_t theta = tanh( GetdEta(eta1,eta2)/2.0 );
  return theta;
}

Double_t PostAnalyzer_MC::GetInvtMass(Int_t pho, Int_t jet){

  Double_t mass = 0.0;

  TLorentzVector Pho;
  Pho.SetPtEtaPhiE((*phoEt)[pho], (*phoSCEta)[pho], (*phoSCPhi)[pho], (*phoE)[pho]);

  TLorentzVector Jet;
  Jet.SetPtEtaPhiE((*jetPt)[jet], (*jetEta)[jet], (*jetPhi)[jet], (*jetEn)[jet] );

  mass = (Pho+Jet).M();

  return mass;
}

Bool_t PostAnalyzer_MC::IsPromptFound(){ //returns true if there is a prompt photon in the event
  //Look for even a single prompt photon in an event
  Bool_t gPromptPhoton = false;
  for(Int_t i = 0; i < nMC; i++){ //mcStatusFlag ==2/3/6 contains isPromptFinalState() (defined in ggNtuplizer_genparticle.cc). Also Read README
    if(fabs((*mcPID)[i]) == 22 && ((*mcStatusFlag)[i] == 2 || (*mcStatusFlag)[i] == 3 || (*mcStatusFlag)[i] == 6)) gPromptPhoton = true;             
  }
  return gPromptPhoton;
}

Bool_t PostAnalyzer_MC::IsPromptFoundOutOf_dR(Double_t dR_Req){ //returns true if there is a prompt photon in the event with dR > dR_Req. (for QCD)
 
  Bool_t gPromptPhoton = false;
  std::vector<Int_t> nPromptPh;
  for(Int_t i = 0; i < nMC; i++){  
    if(fabs((*mcPID)[i]) == 22 && ((*mcStatusFlag)[i] == 2 || (*mcStatusFlag)[i] == 3 || (*mcStatusFlag)[i] == 6) && (*mcEt)[i] > 190.0)
      nPromptPh.push_back(i);
  }

  Double_t dR = 99.0;
  Double_t dR_temp = 99.0;
  for(Int_t j = 0; j < nPromptPh.size(); j++){
    for(Int_t ijet = 0; ijet < nJet; ijet++){
      dR_temp = GetdR((*mcEta)[nPromptPh[j]], (*jetGenEta)[ijet], (*mcPhi)[nPromptPh[j]], (*jetGenPhi)[ijet]);
      if(dR_temp < dR){
	dR = dR_temp;
      }
    }
  }

  if(dR > dR_Req && nPromptPh.size() > 0) gPromptPhoton = true;
  return gPromptPhoton;
}

Bool_t PostAnalyzer_MC::IsPromptFoundInsideOf_dR(Double_t dR_Req){ //returns true if there is a prompt photon in the event with dR > dR_Req. (For GJ)
 
  Bool_t gPromptPhoton = false;
  std::vector<Int_t> nPromptPh;
  for(Int_t i = 0; i < nMC; i++){  
    if(fabs((*mcPID)[i]) == 22 && ((*mcStatusFlag)[i] == 2 || (*mcStatusFlag)[i] == 3 || (*mcStatusFlag)[i] == 6)) nPromptPh.push_back(i);
  }

  Double_t dR = 99.0;
  Double_t dR_temp = 99.0;
  for(Int_t j = 0; j < nPromptPh.size(); j++){
    for(Int_t ijet = 0; ijet < nJet; ijet++){
      dR_temp = GetdR((*mcEta)[nPromptPh[j]], (*jetGenEta)[ijet], (*mcPhi)[nPromptPh[j]], (*jetGenPhi)[ijet]);
      if(dR_temp < dR){
	dR = dR_temp;
      }
    }
  }

  if(dR <= dR_Req) gPromptPhoton = true;
  return gPromptPhoton;
}

Int_t PostAnalyzer_MC::MatchedPromptGenPhotonToReco(Int_t pc){ //Required for removing prompt photons from QCD

  Int_t pc_gen = -1;
  Double_t dR = 10.0;
  Double_t dPt_Pt = 10.0;
  for(Int_t ij = 0; ij < nMC; ij++){
    dR = GetdR((*phoSCEta)[pc], (*mcEta)[ij], (*phoSCPhi)[pc], (*mcPhi)[ij]);
    dPt_Pt = fabs((*phoEt)[pc] - (*mcPt)[ij])/(*phoEt)[pc];
    if((*mcPID)[ij] == 22 && dR < 0.1 && dPt_Pt < 0.1 && ((*mcStatusFlag)[ij] == 2 || (*mcStatusFlag)[ij] == 3 || (*mcStatusFlag)[ij] == 6)){
      pc_gen = ij;
      break;
    }
  }

  return pc_gen;
}

Int_t PostAnalyzer_MC::MatchedNonPromptGenPhotonToReco(Int_t pc){ //Required for removing non prompt photons from GJet

  Int_t pc_gen = -1;
  Double_t dR = 10.0;
  Double_t dPt_Pt = 10.0;
  for(Int_t ij = 0; ij < nMC; ij++){
    dR = GetdR((*phoSCEta)[pc], (*mcEta)[ij], (*phoSCPhi)[pc], (*mcPhi)[ij]);
    dPt_Pt = fabs((*phoEt)[pc] - (*mcPt)[ij])/(*phoEt)[pc];
    if((*mcPID)[ij] == 22 && dR < 0.1 && dPt_Pt < 0.1 && ((*mcStatusFlag)[ij] != 2 && (*mcStatusFlag)[ij] != 3 && (*mcStatusFlag)[ij] != 6)){
      pc_gen = ij;
      break;
    }
  }

  return pc_gen;
}


Int_t PostAnalyzer_MC::MatchedGenJetToReco(Int_t jc){

  Int_t jc_gen = -1;

  if((*jetGenPartonID)[jc] == 21 || fabs((*jetGenPartonID)[jc]) == 1 || fabs((*jetGenPartonID)[jc]) == 2) jc_gen = jc;
 
  return jc_gen;
}


//Returns true for an event which has a reco photon PC with a matched gen prompt photon which is away from any jet/other particle by dR > 0.05
Bool_t PostAnalyzer_MC::IsOverlappedEvent(Int_t pc){

  Int_t pc_match = -1;
  pc_match = MatchedPromptGenPhotonToReco(pc); //Matched prompt gen photon with dR < 0.1 and dpt/pt < 0.1
  Bool_t isPrompt = false;
  double minDR = 99.0;

  if(pc_match > -1){ //true matched photons including overlaps

    for(Int_t ii = 0; ii < nMC; ii++){
      if(ii == pc_match) continue;
      if((*mcStatus)[ii] != 22 && (*mcStatus)[ii] != 23) continue;
      if(fabs((*mcPID)[ii]) > 21) continue;

      double dR_temp = GetdR((*mcEta)[pc_match], (*mcEta)[ii], (*mcPhi)[pc_match], (*mcPhi)[ii]);
      if(dR_temp < minDR) minDR = dR_temp;
    }

    if(minDR > 0.05)  isPrompt = true;
  }

  return isPrompt;

}

Double_t PostAnalyzer_MC::GetGenLevelInvtMass(Int_t pc_gen, Int_t jc_gen){

  Double_t mass = 0.0;

  TLorentzVector GenPho;
  GenPho.SetPtEtaPhiE((*mcPt)[pc_gen], (*mcEta)[pc_gen], (*mcPhi)[pc_gen], (*mcE)[pc_gen]);

  TLorentzVector GenJet;
  GenJet.SetPtEtaPhiE((*jetGenJetPt)[jc_gen], (*jetGenJetEta)[jc_gen], (*jetGenJetPhi)[jc_gen], (*jetGenJetEn)[jc_gen]);

  mass = (GenPho+GenJet).M();
  
  return mass;
}

  //For pileup distribution of MC, we need distribution for trueNumofInteractions. In ggNtuplizer, this distribution has been already saved by the name of histogram 'hPUTrue'. So I have taken one sample of each of MC (GJetsHT100to120, QCD_Pt_300to470, Qstar_M1000_f1p0) and hadded all files and got the 'hPUTrue' histogram from those and saved in PileupHistograms/MC_Run2016BCDEFG_PileUpDist folder. The root script PU.cc used for this getting the hist is also present in the same folder.
void PostAnalyzer_MC::PileupReWeighting(){

  //uncomment in script
  Bool_t Pileup_GJ    = ${GJ};
  Bool_t Pileup_QCD   = ${QCD};
  Bool_t Pileup_EWK   = ${EWK};
  Bool_t Pileup_Bstar = ${Bstar};
  Bool_t Pileup_Qstar = ${Qstar};

    TString puMCfile;
    //uncomment in script
    if(Pileup_GJ)    puMCfile = "GJets_MG_PileupHist";
    if(Pileup_QCD)   puMCfile = "DiJet_PileupHist";
    if(Pileup_EWK)   puMCfile = "EWK_PileupHist";
    if(Pileup_Bstar) puMCfile = "Bstar_PileupHist";
    if(Pileup_Qstar) puMCfile = "Qstar_PileupHist";
    
    //remove this in script
    //puMCfile = "DiJet_PileupHist";

    //For Run2016BCDEFG_PromptReco
  TFile *fData = TFile::Open("/uscms_data/d3/rocky86/13TeV/PostAnalyzer_2015+2016/PostAnalyzer_80X/PostAnalyzer_MC/PA_Main/PileupHistograms/Data_Re-miniAOD-3Feb_Full2016_PileUpDist/DataPileupHist.root");
  TH1F *dataPU = (TH1F*)fData->Get("pileup");
   
  TFile *fMC = TFile::Open("/uscms_data/d3/rocky86/13TeV/PostAnalyzer_2015+2016/PostAnalyzer_80X/PostAnalyzer_MC/PA_Main/PileupHistograms/MC_Summer16_PileUpDist/"+puMCfile+".root");
  TH1F *mcPU = (TH1F*)fMC->Get("hPUTrue");

  mcPU->Rebin(5); //because "hPUTrue" has binning of width 0.2 (1000, 0, 200), that is 1000 bins in the range of 0 to 200.

  std::vector<float> DataPileUp;
  std::vector<float> mcPileUp;
  DataPileUp.clear();
  mcPileUp.clear();
  for(Int_t i = 0; i < 50; i++){
    DataPileUp.push_back(dataPU->GetBinContent(i+1));
    mcPileUp.push_back(mcPU->GetBinContent(i+1));
  }

  TH1F *h_MCWeights = new TH1F("h_MCWeights", "MC PileUp Weights", 50, 0, 50);
  for(Int_t ibin = 0; ibin < 50; ibin++){
    h_DataPUNormDist->SetBinContent(ibin+1, DataPileUp[ibin]); //This to get in output
    h_PUScaleFactor->SetBinContent(ibin+1, DataPileUp[ibin]);
    h_MCPUNormDist->SetBinContent(ibin+1, mcPileUp[ibin]);
    h_MCWeights->SetBinContent(ibin+1, mcPileUp[ibin]);
  }

  h_DataPUNormDist->Scale(1.0/h_DataPUNormDist->Integral());
  h_PUScaleFactor->Scale(1.0/h_PUScaleFactor->Integral());
  h_MCPUNormDist->Scale(1.0/h_MCPUNormDist->Integral());
  h_MCWeights->Scale(1.0/h_MCWeights->Integral());

  h_PUScaleFactor->Divide(h_MCWeights);

}

Double_t PostAnalyzer_MC::PUWeights(Float_t npv){
  Int_t bin = h_PUScaleFactor->GetXaxis()->FindBin( npv );
  return h_PUScaleFactor->GetBinContent( bin );
}

void PostAnalyzer_MC::BookHistograms(){
  file->cd();

  //For now using binning of q* 8 TeV.
    char name[100];
    /*
    const Int_t nMassBins_qstar = 119;
    const Double_t MassBin_qstar[nMassBins_qstar+1] = {1, 3, 6, 10, 16, 23, 31, 40, 50, 61, 73, 86, 100, 115, 132, 150, 169, 189, 210, 232, 252, 273, 295, 318, 341, 365, 390, 416, 443, 471, 500, 530, 560, 593, 626, 660, 695, 731, 768, 806, 846, 887, 929, 972, 1017, 1063, 1110, 1159, 1209, 1261, 1315, 1370, 1427, 1486, 1547, 1609, 1673, 1739, 1807, 1877, 1950, 2025, 2102, 2182, 2264, 2349, 2436, 2526, 2619, 2714, 2812, 2913, 3018, 3126, 3237, 3352, 3470, 3592, 3718, 3847, 3980, 4117, 4259, 4405, 4556, 4711, 4871, 5036, 5206, 5381, 5562, 5748, 5940, 6138, 6342, 6552, 6769, 6993, 7223, 7461, 7706, 7959, 8219, 8487, 8764, 9049, 9343, 9646, 9958, 10280, 10612, 10954, 11307, 11671, 12046, 12432, 12830, 13241, 13664, 14000};
    */
   //latest binning based on q* and b* mass resolution (Summer16)
    const Int_t nMassBins = 111;
    const Double_t MassBin[nMassBins+1] = {1, 16, 32, 48, 65, 82, 100, 118, 137, 157, 177, 198, 220, 242, 265, 289, 313, 338, 364, 391, 419, 447, 476, 506, 537, 569, 602, 636, 671, 700, 737, 775, 815, 856, 898, 941, 986, 1032, 1080, 1129, 1180, 1232, 1286, 1342, 1399, 1458, 1519, 1582, 1647, 1714, 1783, 1854, 1927, 2003, 2081, 2161, 2244, 2329, 2417, 2508, 2602, 2699, 2799, 2902, 3008, 3117, 3230, 3346, 3466, 3590, 3717, 3848, 3984, 4124, 4268, 4417, 4570, 4728, 4891, 5059, 5232, 5411, 5595, 5785, 5981, 6183, 6391, 6606, 6828, 7057, 7293, 7536, 7787, 8046, 8313, 8588, 8872, 9164, 9466, 9777, 10098, 10429, 10770, 11122, 11485, 11859, 12245, 12643, 13053, 13476, 13912, 14000};

    std::string cut0[7] = {"noCut", "noMassCut", "MassCut", "1BTag_noMassCut", "1BTag_MassCut", "0BTag_noMassCut", "0BTag_MassCut"};
    for(Int_t hist0 = 0; hist0 < 7; ++hist0){

      sprintf(name, "h_PhotonPt_%s",cut0[hist0].c_str());
      h_PhotonPt[hist0] = new TH1F(name,"Pt distribution of photons",150,0.0,6000.0);
      h_PhotonPt[hist0]->GetYaxis()->SetTitle("Events/40 GeV");  h_PhotonPt[hist0]->GetYaxis()->CenterTitle();
      h_PhotonPt[hist0]->GetXaxis()->SetTitle("P_{T}^{#gamma} (GeV)");  h_PhotonPt[hist0]->GetXaxis()->CenterTitle();
      h_PhotonPt[hist0]->Sumw2();

      sprintf(name, "h_PhotonCalibPt_%s",cut0[hist0].c_str());
      h_PhotonCalibPt[hist0] = new TH1F(name,"Pt distribution of Calibrated photons",150,0.0,6000.0);
      h_PhotonCalibPt[hist0]->GetYaxis()->SetTitle("Events/40 GeV");  h_PhotonCalibPt[hist0]->GetYaxis()->CenterTitle();
      h_PhotonCalibPt[hist0]->GetXaxis()->SetTitle("P_{T}^{#gamma} (GeV)");  h_PhotonCalibPt[hist0]->GetXaxis()->CenterTitle();
      h_PhotonCalibPt[hist0]->Sumw2();

      sprintf(name, "h_PhotonEta_%s",cut0[hist0].c_str());
      h_PhotonEta[hist0] = new TH1F(name,"Eta distribution of photons",100,-2.5,2.5);
      h_PhotonEta[hist0]->GetYaxis()->SetTitle("Events");  h_PhotonEta[hist0]->GetYaxis()->CenterTitle();
      h_PhotonEta[hist0]->GetXaxis()->SetTitle("#eta^{#gamma}");  h_PhotonEta[hist0]->GetXaxis()->CenterTitle();
      h_PhotonEta[hist0]->Sumw2();

      sprintf(name, "h_PhotonPhi_%s",cut0[hist0].c_str());
      h_PhotonPhi[hist0] = new TH1F(name,"Phi distribution of photons",100,-4.0,4.0);
      h_PhotonPhi[hist0]->GetYaxis()->SetTitle("Events");  h_PhotonPhi[hist0]->GetYaxis()->CenterTitle();
      h_PhotonPhi[hist0]->GetXaxis()->SetTitle("#phi^{#gamma}");   h_PhotonPhi[hist0]->GetXaxis()->CenterTitle();
      h_PhotonPhi[hist0]->Sumw2();

      sprintf(name, "h_Photon_SigmaIEtaIEta_%s",cut0[hist0].c_str());
      h_Photon_SigmaIEtaIEta[hist0] = new TH1F(name,"Photon SigmaIetaIeta Distribution",100,0.0,0.05);
      h_Photon_SigmaIEtaIEta[hist0]->GetYaxis()->SetTitle("Events");  h_Photon_SigmaIEtaIEta[hist0]->GetYaxis()->CenterTitle();
      h_Photon_SigmaIEtaIEta[hist0]->GetXaxis()->SetTitle("#sigma_{i#etai#eta}");  h_Photon_SigmaIEtaIEta[hist0]->GetXaxis()->CenterTitle();
      h_Photon_SigmaIEtaIEta[hist0]->Sumw2();

      sprintf(name, "h_Photon_R9_%s",cut0[hist0].c_str());
      h_Photon_R9[hist0] = new TH1F(name,"Photon R9 Distribution",100,0.0,10.0);
      h_Photon_R9[hist0]->GetYaxis()->SetTitle("Events");       h_Photon_R9[hist0]->GetYaxis()->CenterTitle();
      h_Photon_R9[hist0]->GetXaxis()->SetTitle("Photon_r9");    h_Photon_R9[hist0]->GetXaxis()->CenterTitle();
      h_Photon_R9[hist0]->Sumw2();

      sprintf(name, "h_Photon_HoverE_%s",cut0[hist0].c_str());
      h_Photon_HoverE[hist0] = new TH1F(name,"Photon HoverE Distribution",50,0.0,0.1);
      h_Photon_HoverE[hist0]->GetYaxis()->SetTitle("Events");   h_Photon_HoverE[hist0]->GetYaxis()->CenterTitle();
      h_Photon_HoverE[hist0]->GetXaxis()->SetTitle("H/E");      h_Photon_HoverE[hist0]->GetXaxis()->CenterTitle();
      h_Photon_HoverE[hist0]->Sumw2();

      sprintf(name, "h_Photon_EleVeto_%s",cut0[hist0].c_str());
      h_Photon_EleVeto[hist0] = new TH1F(name,"Photon ElectronVeto",3,0,3);
      h_Photon_EleVeto[hist0]->GetYaxis()->SetTitle("Events");     h_Photon_EleVeto[hist0]->GetYaxis()->CenterTitle();
      h_Photon_EleVeto[hist0]->GetXaxis()->SetTitle("EleVeto");    h_Photon_EleVeto[hist0]->GetXaxis()->CenterTitle();
      h_Photon_EleVeto[hist0]->Sumw2();

      sprintf(name, "h_Photon_CorrPFChIso_%s",cut0[hist0].c_str());
      h_Photon_CorrPFChIso[hist0] = new TH1F(name,"Rho Corrected PF Charged Isolation",625,0,25);
      h_Photon_CorrPFChIso[hist0]->GetYaxis()->SetTitle("Events");        h_Photon_CorrPFChIso[hist0]->GetYaxis()->CenterTitle();
      h_Photon_CorrPFChIso[hist0]->GetXaxis()->SetTitle("CorrPFChIso");   h_Photon_CorrPFChIso[hist0]->GetXaxis()->CenterTitle();
      h_Photon_CorrPFChIso[hist0]->Sumw2();

      sprintf(name, "h_Photon_CorrPFNeuIso_%s",cut0[hist0].c_str());
      h_Photon_CorrPFNeuIso[hist0] = new TH1F(name,"Rho Corrected PF Neutral Isolation",100,0,300);
      h_Photon_CorrPFNeuIso[hist0]->GetYaxis()->SetTitle("Events");    h_Photon_CorrPFNeuIso[hist0]->GetYaxis()->CenterTitle();
      h_Photon_CorrPFNeuIso[hist0]->GetXaxis()->SetTitle("CorrPFNeuIso");    h_Photon_CorrPFNeuIso[hist0]->GetXaxis()->CenterTitle();
      h_Photon_CorrPFNeuIso[hist0]->Sumw2();

      sprintf(name, "h_Photon_CorrPFPhoIso_%s",cut0[hist0].c_str());
      h_Photon_CorrPFPhoIso[hist0] = new TH1F(name,"Rho Corrected PF Photon Isolation",125,0,25);
      h_Photon_CorrPFPhoIso[hist0]->GetYaxis()->SetTitle("Events");    h_Photon_CorrPFPhoIso[hist0]->GetYaxis()->CenterTitle();
      h_Photon_CorrPFPhoIso[hist0]->GetXaxis()->SetTitle("CorrPFPhoIso"); h_Photon_CorrPFPhoIso[hist0]->GetXaxis()->CenterTitle();
      h_Photon_CorrPFPhoIso[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_JetPt_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJetPt_%s",cut0[hist0].c_str());
      h_bJetPt[hist0] = new TH1F(name,"Pt distribution of jets",150,0.0,6000.0);
      h_bJetPt[hist0]->GetYaxis()->SetTitle("Events/40 GeV");  h_bJetPt[hist0]->GetYaxis()->CenterTitle();
      h_bJetPt[hist0]->GetXaxis()->SetTitle("P_{T}^{Jet} (GeV)");  h_bJetPt[hist0]->GetXaxis()->CenterTitle();
      h_bJetPt[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_JetEta_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJetEta_%s",cut0[hist0].c_str());
      h_bJetEta[hist0] = new TH1F(name,"Eta distribution of jets",120,-3.0,3.0);
      h_bJetEta[hist0]->GetYaxis()->SetTitle("Events");      h_bJetEta[hist0]->GetYaxis()->CenterTitle();
      h_bJetEta[hist0]->GetXaxis()->SetTitle("#eta^{Jet}");  h_bJetEta[hist0]->GetXaxis()->CenterTitle();
      h_bJetEta[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_JetPhi_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJetPhi_%s",cut0[hist0].c_str());
      h_bJetPhi[hist0] = new TH1F(name,"Phi distribution of jets",100,-4.0,4.0);
      h_bJetPhi[hist0]->GetYaxis()->SetTitle("Events");      h_bJetPhi[hist0]->GetYaxis()->CenterTitle();
      h_bJetPhi[hist0]->GetXaxis()->SetTitle("#phi^{Jet}");  h_bJetPhi[hist0]->GetXaxis()->CenterTitle();
      h_bJetPhi[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_Jet_Mt_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJet_Mt_%s",cut0[hist0].c_str());
      h_bJet_Mt[hist0] = new TH1F(name,"Transverse mass distribution of jets",150,0.0,6000.0);
      h_bJet_Mt[hist0]->GetYaxis()->SetTitle("Events/40 GeV");      h_bJet_Mt[hist0]->GetYaxis()->CenterTitle();
      h_bJet_Mt[hist0]->GetXaxis()->SetTitle("M_{T}^{Jet}");  h_bJet_Mt[hist0]->GetXaxis()->CenterTitle();
      h_bJet_Mt[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_Jet_area_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJet_area_%s",cut0[hist0].c_str());
      h_bJet_area[hist0] = new TH1F(name,"Jets area",25,0.0,1000.0);
      h_bJet_area[hist0]->GetYaxis()->SetTitle("Events/40 GeV");      h_bJet_area[hist0]->GetYaxis()->CenterTitle();
      h_bJet_area[hist0]->GetXaxis()->SetTitle("JetArea");  h_bJet_area[hist0]->GetXaxis()->CenterTitle();
      h_bJet_area[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_Jet_Mass_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJet_Mass_%s",cut0[hist0].c_str());
      h_bJet_Mass[hist0] = new TH1F(name,"Mass distribution of jets",150,0.0,6000.0);
      h_bJet_Mass[hist0]->GetYaxis()->SetTitle("Events/40 GeV");      h_bJet_Mass[hist0]->GetYaxis()->CenterTitle();
      h_bJet_Mass[hist0]->GetXaxis()->SetTitle("M^{Jet}");  h_bJet_Mass[hist0]->GetXaxis()->CenterTitle();
      h_bJet_Mass[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_Jet_NHEF_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJet_NHEF_%s",cut0[hist0].c_str());
      h_bJet_NHEF[hist0] = new TH1F(name,"Neutral Hadron Energy Fraction",25,0,1);
      h_bJet_NHEF[hist0]->GetYaxis()->SetTitle("Events");      h_bJet_NHEF[hist0]->GetYaxis()->CenterTitle();
      h_bJet_NHEF[hist0]->GetXaxis()->SetTitle("Jet_NHEF");    h_bJet_NHEF[hist0]->GetXaxis()->CenterTitle();
      h_bJet_NHEF[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_Jet_NEEF_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJet_NEEF_%s",cut0[hist0].c_str());
      h_bJet_NEEF[hist0] = new TH1F(name,"Neutral Em Energy Fraction",25,0,1);
      h_bJet_NEEF[hist0]->GetYaxis()->SetTitle("Events");       h_bJet_NEEF[hist0]->GetYaxis()->CenterTitle();
      h_bJet_NEEF[hist0]->GetXaxis()->SetTitle("Jet_NEEF");     h_bJet_NEEF[hist0]->GetXaxis()->CenterTitle();
      h_bJet_NEEF[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_Jet_NConst_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJet_NConst_%s",cut0[hist0].c_str());
      h_bJet_NConst[hist0] = new TH1F(name,"No. of Constituents",100,0,100);
      h_bJet_NConst[hist0]->GetYaxis()->SetTitle("Events");      h_bJet_NConst[hist0]->GetYaxis()->CenterTitle();
      h_bJet_NConst[hist0]->GetXaxis()->SetTitle("Jet_NConst");  h_bJet_NConst[hist0]->GetXaxis()->CenterTitle();
      h_bJet_NConst[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_Jet_CHEF_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJet_CHEF_%s",cut0[hist0].c_str());
      h_bJet_CHEF[hist0] = new TH1F(name,"Charged Hadron Energy Fraction",25,0,1);
      h_bJet_CHEF[hist0]->GetYaxis()->SetTitle("Events");      h_bJet_CHEF[hist0]->GetYaxis()->CenterTitle();
      h_bJet_CHEF[hist0]->GetXaxis()->SetTitle("Jet_CHEF");    h_bJet_CHEF[hist0]->GetXaxis()->CenterTitle();
      h_bJet_CHEF[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_Jet_ChMult_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJet_ChMult_%s",cut0[hist0].c_str());
      h_bJet_ChMult[hist0] = new TH1F(name,"Charged Multiplicity",100,0,100);
      h_bJet_ChMult[hist0]->GetYaxis()->SetTitle("Events");       h_bJet_ChMult[hist0]->GetYaxis()->CenterTitle();
      h_bJet_ChMult[hist0]->GetXaxis()->SetTitle("Jet_ChMult");   h_bJet_ChMult[hist0]->GetXaxis()->CenterTitle();
      h_bJet_ChMult[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_Jet_CEEF_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJet_CEEF_%s",cut0[hist0].c_str());
      h_bJet_CEEF[hist0] = new TH1F(name,"Charged Em Energy Fraction",25,0,1);
      h_bJet_CEEF[hist0]->GetYaxis()->SetTitle("Events");      h_bJet_CEEF[hist0]->GetYaxis()->CenterTitle();
      h_bJet_CEEF[hist0]->GetXaxis()->SetTitle("Jet_CEEF");    h_bJet_CEEF[hist0]->GetXaxis()->CenterTitle();
      h_bJet_CEEF[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_Jet_MUF_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJet_MUF_%s",cut0[hist0].c_str());
      h_bJet_MUF[hist0] = new TH1F(name,"Muon Fraction",25,0,1);
      h_bJet_MUF[hist0]->GetYaxis()->SetTitle("Events");      h_bJet_MUF[hist0]->GetYaxis()->CenterTitle();
      h_bJet_MUF[hist0]->GetXaxis()->SetTitle("Jet_MUF");    h_bJet_MUF[hist0]->GetXaxis()->CenterTitle();
      h_bJet_MUF[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_Jet_NNP_%s",cut0[hist0].c_str());
      else sprintf(name, "h_bJet_NNP_%s",cut0[hist0].c_str());
      h_bJet_NNP[hist0] = new TH1F(name,"Number of neutral particles",100,0,100);
      h_bJet_NNP[hist0]->GetYaxis()->SetTitle("Events");      h_bJet_NNP[hist0]->GetYaxis()->CenterTitle();
      h_bJet_NNP[hist0]->GetXaxis()->SetTitle("Jet_NNP");    h_bJet_NNP[hist0]->GetXaxis()->CenterTitle();
      h_bJet_NNP[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_GJetInvtMass_VarBin_%s",cut0[hist0].c_str());
      else sprintf(name, "h_GbJetInvtMass_VarBin_%s",cut0[hist0].c_str());
      h_GbJetInvtMass_VarBin[hist0] = new TH1F(name, "Invt mass distribution", nMassBins, MassBin);
      h_GbJetInvtMass_VarBin[hist0]->GetYaxis()->SetTitle("Events/VarBin"); h_GbJetInvtMass_VarBin[hist0]->GetYaxis()->CenterTitle();
      h_GbJetInvtMass_VarBin[hist0]->GetXaxis()->SetTitle("Invt Mass (GeV)");    h_GbJetInvtMass_VarBin[hist0]->GetXaxis()->CenterTitle();
      h_GbJetInvtMass_VarBin[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_GJetInvtMass_UnitBin_%s",cut0[hist0].c_str());
      else sprintf(name, "h_GbJetInvtMass_UnitBin_%s",cut0[hist0].c_str());
      h_GbJetInvtMass_UnitBin[hist0] = new TH1F(name,"Invt mass distribution", 14000, 0.0, 14000.0);
      h_GbJetInvtMass_UnitBin[hist0]->GetYaxis()->SetTitle("Events/UnitBin");   h_GbJetInvtMass_UnitBin[hist0]->GetYaxis()->CenterTitle();
      h_GbJetInvtMass_UnitBin[hist0]->GetXaxis()->SetTitle("Invt Mass (GeV)"); h_GbJetInvtMass_UnitBin[hist0]->GetXaxis()->CenterTitle();
      h_GbJetInvtMass_UnitBin[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_GJet_dEta_%s",cut0[hist0].c_str());
      else sprintf(name, "h_GbJet_dEta_%s",cut0[hist0].c_str());
      h_GbJet_dEta[hist0] = new TH1F(name, "delta Eta dist", 120, 0, 6);
      h_GbJet_dEta[hist0]->GetYaxis()->SetTitle("Events");         h_GbJet_dEta[hist0]->GetYaxis()->CenterTitle();
      h_GbJet_dEta[hist0]->GetXaxis()->SetTitle("#Delta #eta");    h_GbJet_dEta[hist0]->GetXaxis()->CenterTitle();
      h_GbJet_dEta[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_GJet_dPhi_%s",cut0[hist0].c_str());
      else sprintf(name, "h_GbJet_dPhi_%s",cut0[hist0].c_str());
      h_GbJet_dPhi[hist0] = new TH1F(name, "delta Phi dist", 64, 0, 3.2);
      h_GbJet_dPhi[hist0]->GetYaxis()->SetTitle("Events");       h_GbJet_dPhi[hist0]->GetYaxis()->CenterTitle();
      h_GbJet_dPhi[hist0]->GetXaxis()->SetTitle("#Delta #phi");  h_GbJet_dPhi[hist0]->GetXaxis()->CenterTitle();
      h_GbJet_dPhi[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_GJet_dR_%s",cut0[hist0].c_str());
      else sprintf(name, "h_GbJet_dR_%s",cut0[hist0].c_str());
      h_GbJet_dR[hist0] = new TH1F(name, "delta R dist", 100, 0.0, 10.0);
      h_GbJet_dR[hist0]->GetYaxis()->SetTitle("Events");          h_GbJet_dR[hist0]->GetYaxis()->CenterTitle();
      h_GbJet_dR[hist0]->GetXaxis()->SetTitle("#Delta R");        h_GbJet_dR[hist0]->GetXaxis()->CenterTitle();
      h_GbJet_dR[hist0]->Sumw2();

      sprintf(name, "h_cosThetaStar_%s",cut0[hist0].c_str());
      h_cosThetaStar[hist0] = new TH1F(name,"Cos theta star of photon+jet",50,0,1);
      h_cosThetaStar[hist0]->GetYaxis()->SetTitle("Events");        h_cosThetaStar[hist0]->GetYaxis()->CenterTitle();
      h_cosThetaStar[hist0]->GetXaxis()->SetTitle("cos#theta*");    h_cosThetaStar[hist0]->GetXaxis()->CenterTitle();
      h_cosThetaStar[hist0]->Sumw2();

      sprintf(name, "h_PFMet_%s",cut0[hist0].c_str());
      h_PFMet[hist0] = new TH1F(name, "PFMet distribution", 200,0.0,1000.0);
      h_PFMet[hist0]->GetYaxis()->SetTitle("Events/5 GeV");           h_PFMet[hist0]->GetYaxis()->CenterTitle();
      h_PFMet[hist0]->GetXaxis()->SetTitle("#slash{E}_{T} (GeV)");    h_PFMet[hist0]->GetXaxis()->CenterTitle();
      h_PFMet[hist0]->Sumw2();

      sprintf(name, "h_SumPFMet_%s",cut0[hist0].c_str());
      h_SumPFMet[hist0]  = new TH1F(name,"SumET PF Met distribution",80,0.0,4000.0);
      h_SumPFMet[hist0]->GetYaxis()->SetTitle("Events/50 GeV");            h_SumPFMet[hist0]->GetYaxis()->CenterTitle();
      h_SumPFMet[hist0]->GetXaxis()->SetTitle("#sum#slash{E}_{T} (GeV)");  h_SumPFMet[hist0]->GetXaxis()->CenterTitle();
      h_SumPFMet[hist0]->Sumw2();

      sprintf(name, "h_MetBySumMET_%s",cut0[hist0].c_str());
      h_MetBySumMET[hist0]  = new TH1F(name,"MET / SumET PF Met",50,0.0,1.0);
      h_MetBySumMET[hist0]->GetYaxis()->SetTitle("Events");        h_MetBySumMET[hist0]->GetYaxis()->CenterTitle();
      h_MetBySumMET[hist0]->GetXaxis()->SetTitle("#slash{E}_{T}/#sum#slash{E}_{T}"); h_MetBySumMET[hist0]->GetXaxis()->CenterTitle();
      h_MetBySumMET[hist0]->Sumw2();

      sprintf(name, "h_PFMetVsGJmass_%s",cut0[hist0].c_str());
      h_PFMetVsGJmass[hist0] = new TH2F(name, "PFMet Vs InvtMass", 1400, 0.0, 14000.0, 150, 0.0, 6000.0);
      h_PFMetVsGJmass[hist0]->GetYaxis()->SetTitle("PFMET (GeV)");    h_PFMetVsGJmass[hist0]->GetYaxis()->CenterTitle();
      h_PFMetVsGJmass[hist0]->GetXaxis()->SetTitle("Invt Mass (GeV)");  h_PFMetVsGJmass[hist0]->GetXaxis()->CenterTitle();
      h_PFMetVsGJmass[hist0]->Sumw2();

      sprintf(name, "h_PFMetOverSumEtVsGJmass_%s",cut0[hist0].c_str());
      h_PFMetOverSumEtVsGJmass[hist0] = new TH2F(name, "PFMet/SumEt Vs InvtMass", 1400, 0.0, 14000.0, 1000, 0.0, 10.0);
      h_PFMetOverSumEtVsGJmass[hist0]->GetYaxis()->SetTitle("PFMET/SumEt (GeV)");  h_PFMetOverSumEtVsGJmass[hist0]->GetYaxis()->CenterTitle();
      h_PFMetOverSumEtVsGJmass[hist0]->GetXaxis()->SetTitle("Invt Mass (GeV)");  h_PFMetOverSumEtVsGJmass[hist0]->GetXaxis()->CenterTitle();
      h_PFMetOverSumEtVsGJmass[hist0]->Sumw2();

      sprintf(name, "h_MetByPhPt_%s",cut0[hist0].c_str());
      h_MetByPhPt[hist0]  = new TH1F(name,"MET / PTgamma",100,0.0,2.0);
      h_MetByPhPt[hist0]->GetYaxis()->SetTitle("Events");        h_MetByPhPt[hist0]->GetYaxis()->CenterTitle();
      h_MetByPhPt[hist0]->GetXaxis()->SetTitle("MET/P_{T}^{#gamma}"); h_MetByPhPt[hist0]->GetXaxis()->CenterTitle();
      h_MetByPhPt[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_PhPt_vs_JetPt_%s",cut0[hist0].c_str());
      else sprintf(name, "h_PhPt_vs_bJetPt_%s",cut0[hist0].c_str());
      h_PhPt_vs_bJetPt[hist0] = new TH2F(name,"Pt of Photon vs Jet ",120,0.0,4800.0,120,0.0,4800.0);
      h_PhPt_vs_bJetPt[hist0]->GetYaxis()->SetTitle("P_{T}^{Jet}");   h_PhPt_vs_bJetPt[hist0]->GetYaxis()->CenterTitle();
      h_PhPt_vs_bJetPt[hist0]->GetXaxis()->SetTitle("P_{T}^{#gamma}");  h_PhPt_vs_bJetPt[hist0]->GetXaxis()->CenterTitle();
      h_PhPt_vs_bJetPt[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_PhEta_vs_JetEta_%s",cut0[hist0].c_str());
      else sprintf(name, "h_PhEta_vs_bJetEta_%s",cut0[hist0].c_str());
      h_PhEta_vs_bJetEta[hist0] = new TH2F(name,"eta of Photon vs Jet ",100,-2.5,2.5,100,-2.5,2.5);
      h_PhEta_vs_bJetEta[hist0]->GetYaxis()->SetTitle("#eta^{Jet}");     h_PhEta_vs_bJetEta[hist0]->GetYaxis()->CenterTitle();
      h_PhEta_vs_bJetEta[hist0]->GetXaxis()->SetTitle("#eta^{#gamma}");  h_PhEta_vs_bJetEta[hist0]->GetXaxis()->CenterTitle();
      h_PhEta_vs_bJetEta[hist0]->Sumw2();

      sprintf(name, "h_CSVv2Dist_%s",cut0[hist0].c_str());
      h_CSVv2Dist[hist0] = new TH1F(name, "CSVv2 bTagger Distribution", 500, 0.0, 5.0);
      h_CSVv2Dist[hist0]->GetYaxis()->SetTitle("Events");      h_CSVv2Dist[hist0]->GetYaxis()->CenterTitle();
      h_CSVv2Dist[hist0]->GetXaxis()->SetTitle("CSVv2");       h_CSVv2Dist[hist0]->GetXaxis()->CenterTitle();
      h_CSVv2Dist[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_CSVv2_vs_JetPt_%s",cut0[hist0].c_str());
      else sprintf(name, "h_CSVv2_vs_bJetPt_%s",cut0[hist0].c_str());
      h_CSVv2_vs_bJetPt[hist0] = new TH2F(name,"CSVv2 vs Jet Pt", 120, 0.0, 4800.0, 500, 0.0, 5.0);
      h_CSVv2_vs_bJetPt[hist0]->GetYaxis()->SetTitle("CSVv2");         h_CSVv2_vs_bJetPt[hist0]->GetYaxis()->CenterTitle();
      h_CSVv2_vs_bJetPt[hist0]->GetXaxis()->SetTitle("P_{T}^{Jet}");   h_CSVv2_vs_bJetPt[hist0]->GetXaxis()->CenterTitle();
      h_CSVv2_vs_bJetPt[hist0]->Sumw2();

      if(hist0 == 0 || hist0 == 1 || hist0 == 2) sprintf(name, "h_CSVv2_vs_JetEta_%s",cut0[hist0].c_str());
      else sprintf(name, "h_CSVv2_vs_bJetEta_%s",cut0[hist0].c_str());
      h_CSVv2_vs_bJetEta[hist0] = new TH2F(name,"CSVv2 vs Jet Eta", 100, -2.5, 2.5, 500, 0.0, 5.0);
      h_CSVv2_vs_bJetEta[hist0]->GetYaxis()->SetTitle("CSVv2");         h_CSVv2_vs_bJetEta[hist0]->GetYaxis()->CenterTitle();
      h_CSVv2_vs_bJetEta[hist0]->GetXaxis()->SetTitle("#eta^{Jet}");    h_CSVv2_vs_bJetEta[hist0]->GetXaxis()->CenterTitle();
      h_CSVv2_vs_bJetEta[hist0]->Sumw2();

      sprintf(name, "h_goodPV_TotalWt_%s",cut0[hist0].c_str());
      h_goodPV_TotalWt[hist0] = new TH1F(name,"No. of Good Primary Vertices", 50, 0, 50);
      h_goodPV_TotalWt[hist0]->GetYaxis()->SetTitle("Events");   h_goodPV_TotalWt[hist0]->GetYaxis()->CenterTitle();
      h_goodPV_TotalWt[hist0]->GetXaxis()->SetTitle("nPV");      h_goodPV_TotalWt[hist0]->GetXaxis()->CenterTitle();
      h_goodPV_TotalWt[hist0]->Sumw2();

      sprintf(name, "h_nIsoPhotons_%s",cut0[hist0].c_str());
      h_nIsoPhotons[hist0] = new TH1F(name,"No. of Isolated Photons", 400, 0, 200);
      h_nIsoPhotons[hist0]->GetYaxis()->SetTitle("Events");         h_nIsoPhotons[hist0]->GetYaxis()->CenterTitle();
      h_nIsoPhotons[hist0]->GetXaxis()->SetTitle("nIsoPhotons");    h_nIsoPhotons[hist0]->GetXaxis()->CenterTitle();
      h_nIsoPhotons[hist0]->Sumw2();

      sprintf(name, "h_nGoodPhotons_%s",cut0[hist0].c_str());
      h_nGoodPhotons[hist0] = new TH1F(name,"No. of Good Isolated Photons", 400, 0, 200);
      h_nGoodPhotons[hist0]->GetYaxis()->SetTitle("Events");          h_nGoodPhotons[hist0]->GetYaxis()->CenterTitle();
      h_nGoodPhotons[hist0]->GetXaxis()->SetTitle("nGoodPhotons");    h_nGoodPhotons[hist0]->GetXaxis()->CenterTitle();
      h_nGoodPhotons[hist0]->Sumw2();

      sprintf(name, "h_IsoPhotonIdxVsPt_%s",cut0[hist0].c_str());
      h_IsoPhotonIdxVsPt[hist0] = new TH2F(name,"Isolated Photons Index Vs Pt", 120, 0.0, 4800.0, 10, 0.0, 10.0);
      h_IsoPhotonIdxVsPt[hist0]->GetYaxis()->SetTitle("IsoPhotonIdx");      h_IsoPhotonIdxVsPt[hist0]->GetYaxis()->CenterTitle();
      h_IsoPhotonIdxVsPt[hist0]->GetXaxis()->SetTitle("P^{T}_{#gamma}");    h_IsoPhotonIdxVsPt[hist0]->GetXaxis()->CenterTitle();
      h_IsoPhotonIdxVsPt[hist0]->Sumw2();

      sprintf(name, "h_GoodPhotonIdxVsPt_%s",cut0[hist0].c_str());
      h_GoodPhotonIdxVsPt[hist0] = new TH2F(name,"Good Isolated Photons Idx Vs Pt", 120, 0.0, 4800.0, 10, 0.0, 10.0);
      h_GoodPhotonIdxVsPt[hist0]->GetYaxis()->SetTitle("GoodPhotonIdx");         h_GoodPhotonIdxVsPt[hist0]->GetYaxis()->CenterTitle();
      h_GoodPhotonIdxVsPt[hist0]->GetXaxis()->SetTitle("P^{T}_{#gamma}");       h_GoodPhotonIdxVsPt[hist0]->GetXaxis()->CenterTitle();
      h_GoodPhotonIdxVsPt[hist0]->Sumw2();

      sprintf(name, "h_nJets_%s",cut0[hist0].c_str());
      h_nJets[hist0] = new TH1F(name,"No. of Jets", 400, 0, 200);
      h_nJets[hist0]->GetYaxis()->SetTitle("Events");      h_nJets[hist0]->GetYaxis()->CenterTitle();
      h_nJets[hist0]->GetXaxis()->SetTitle("nJets");       h_nJets[hist0]->GetXaxis()->CenterTitle();
      h_nJets[hist0]->Sumw2();

      sprintf(name, "h_JetIdxVsPt_%s",cut0[hist0].c_str());
      h_JetIdxVsPt[hist0] = new TH2F(name,"Jet Idx vs Pt", 120, 0.0, 4800.0, 20, 0.0, 20.0);
      h_JetIdxVsPt[hist0]->GetYaxis()->SetTitle("Jet Idx");           h_JetIdxVsPt[hist0]->GetYaxis()->CenterTitle();
      h_JetIdxVsPt[hist0]->GetXaxis()->SetTitle("P^{T}_{Jet}");       h_JetIdxVsPt[hist0]->GetXaxis()->CenterTitle();
      h_JetIdxVsPt[hist0]->Sumw2();

    }

    std::string Flv[3] = {"b", "c", "light"};
    for(Int_t f = 0; f < 3; f++){
      sprintf(name, "h_BTagSF_vs_pt_%s", Flv[f].c_str());
      h_BTagSF_vs_pt[f] = new TH2F(name, "BTagSF vs jet pt", 100, 0, 2000, 30, 0, 1.5);
      h_BTagSF_vs_pt[f]->GetYaxis()->SetTitle("BTag SF");     h_BTagSF_vs_pt[f]->GetYaxis()->CenterTitle();
      h_BTagSF_vs_pt[f]->GetXaxis()->SetTitle("P_{T}^{Jet}");  h_BTagSF_vs_pt[f]->GetXaxis()->CenterTitle();
      h_BTagSF_vs_pt[f]->Sumw2();

      sprintf(name, "h_BTagSF_vs_eta_%s", Flv[f].c_str());
      h_BTagSF_vs_eta[f] = new TH2F(name, "BTagSF vs jet eta", 100, -3.0, 3.0, 30, 0, 1.5);
      h_BTagSF_vs_eta[f]->GetYaxis()->SetTitle("BTag SF");     h_BTagSF_vs_eta[f]->GetYaxis()->CenterTitle();
      h_BTagSF_vs_eta[f]->GetXaxis()->SetTitle("#eta^{Jet}");  h_BTagSF_vs_eta[f]->GetXaxis()->CenterTitle();
      h_BTagSF_vs_eta[f]->Sumw2();

      sprintf(name, "h_BTagSFerr_vs_pt_%s", Flv[f].c_str());
      h_BTagSFerr_vs_pt[f] = new TH2F(name, "BTagSFerr vs jet pt", 100, 0, 2000, 60, -1.5, 1.5);
      h_BTagSFerr_vs_pt[f]->GetYaxis()->SetTitle("BTag SFerr");     h_BTagSFerr_vs_pt[f]->GetYaxis()->CenterTitle();
      h_BTagSFerr_vs_pt[f]->GetXaxis()->SetTitle("P_{T}^{Jet}");  h_BTagSFerr_vs_pt[f]->GetXaxis()->CenterTitle();
      h_BTagSFerr_vs_pt[f]->Sumw2();

      sprintf(name, "h_BTagSFerr_vs_eta_%s", Flv[f].c_str());
      h_BTagSFerr_vs_eta[f] = new TH2F(name, "BTagSFerr vs jet eta", 100, -3.0, 3.0, 60, -1.5, 1.5);
      h_BTagSFerr_vs_eta[f]->GetYaxis()->SetTitle("BTag SFerr");     h_BTagSFerr_vs_eta[f]->GetYaxis()->CenterTitle();
      h_BTagSFerr_vs_eta[f]->GetXaxis()->SetTitle("#eta^{Jet}");  h_BTagSFerr_vs_eta[f]->GetXaxis()->CenterTitle();
      h_BTagSFerr_vs_eta[f]->Sumw2();

    }

    std::string cut1[3] = {"BeforeOverlapRemoval", "AfterOverlapRemoval", "AfterOverlapRemoval_AfterFinalSelection"};
    for(Int_t hist1 = 0; hist1 < 3; ++hist1){

      sprintf(name, "h_matchedPromptGenPhoton_GenParton_dR_%s", cut1[hist1].c_str());
      h_matchedPromptGenPhoton_GenParton_dR[hist1] = new TH1F(name,"dR between matched prompt gen photon and Gen parton", 200, 0.0, 10.0); 
      h_matchedPromptGenPhoton_GenParton_dR[hist1]->GetYaxis()->SetTitle("Events");   h_matchedPromptGenPhoton_GenParton_dR[hist1]->GetYaxis()->CenterTitle();
      h_matchedPromptGenPhoton_GenParton_dR[hist1]->GetXaxis()->SetTitle("#Delta R(genPhoton-genParton)"); h_matchedPromptGenPhoton_GenParton_dR[hist1]->GetXaxis()->CenterTitle();
      h_matchedPromptGenPhoton_GenParton_dR[hist1]->Sumw2();

      sprintf(name, "h_matchedNonPromptGenPhoton_GenParton_dR_%s", cut1[hist1].c_str());
      h_matchedNonPromptGenPhoton_GenParton_dR[hist1] = new TH1F(name,"dR between matched non-prompt gen photon and Gen parton", 200, 0.0, 10.0); 
      h_matchedNonPromptGenPhoton_GenParton_dR[hist1]->GetYaxis()->SetTitle("Events");   h_matchedNonPromptGenPhoton_GenParton_dR[hist1]->GetYaxis()->CenterTitle();
      h_matchedNonPromptGenPhoton_GenParton_dR[hist1]->GetXaxis()->SetTitle("#Delta R(genPhoton-genParton)"); h_matchedNonPromptGenPhoton_GenParton_dR[hist1]->GetXaxis()->CenterTitle();
      h_matchedNonPromptGenPhoton_GenParton_dR[hist1]->Sumw2();

      sprintf(name, "h_matchedPromptGenPhoton_GenParton_dPToverPT_%s", cut1[hist1].c_str());
      h_matchedPromptGenPhoton_GenParton_dPToverPT[hist1] = new TH1F(name,"dPt/Pt between matched prompt gen photon and Gen parton", 100, 0.0, 1.0);
      h_matchedPromptGenPhoton_GenParton_dPToverPT[hist1]->GetYaxis()->SetTitle("Events");      h_matchedPromptGenPhoton_GenParton_dPToverPT[hist1]->GetYaxis()->CenterTitle();
      h_matchedPromptGenPhoton_GenParton_dPToverPT[hist1]->GetXaxis()->SetTitle("dPt/Pt");      h_matchedPromptGenPhoton_GenParton_dPToverPT[hist1]->GetXaxis()->CenterTitle();
      h_matchedPromptGenPhoton_GenParton_dPToverPT[hist1]->Sumw2();

      sprintf(name, "h_matchedNonPromptGenPhoton_GenParton_dPToverPT_%s", cut1[hist1].c_str());
      h_matchedNonPromptGenPhoton_GenParton_dPToverPT[hist1] = new TH1F(name,"dPt/Pt between matched non-prompt gen photon and Gen parton", 100, 0.0, 1.0);
      h_matchedNonPromptGenPhoton_GenParton_dPToverPT[hist1]->GetYaxis()->SetTitle("Events");      h_matchedNonPromptGenPhoton_GenParton_dPToverPT[hist1]->GetYaxis()->CenterTitle();
      h_matchedNonPromptGenPhoton_GenParton_dPToverPT[hist1]->GetXaxis()->SetTitle("dPt/Pt");      h_matchedNonPromptGenPhoton_GenParton_dPToverPT[hist1]->GetXaxis()->CenterTitle();
      h_matchedNonPromptGenPhoton_GenParton_dPToverPT[hist1]->Sumw2();

    }

    const Int_t n_eff_pt = 26;
    const Double_t Eff_bins_pt[n_eff_pt+1] = {20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 250, 300, 350, 400, 450, 500, 550, 600, 700, 800, 900, 1000, 1200, 1400, 1600, 1800, 2000};

    std::string cut2[3] = {"noTag", "withTag_noSF", "withTag_SF"};
    for(Int_t hist2 = 0; hist2 < 3; ++hist2){

      sprintf(name, "h_bEff_vs_pt_%s", cut2[hist2].c_str());
      h_bEff_vs_pt[hist2] = new TH1F(name, "bEff_vs_pt", n_eff_pt, Eff_bins_pt);
      h_bEff_vs_pt[hist2]->GetYaxis()->SetTitle("b jet efficiency");     h_bEff_vs_pt[hist2]->GetYaxis()->CenterTitle();
      h_bEff_vs_pt[hist2]->GetXaxis()->SetTitle("P_{T}^{Jet} (GeV)");    h_bEff_vs_pt[hist2]->GetXaxis()->CenterTitle();
      h_bEff_vs_pt[hist2]->Sumw2();

      sprintf(name, "h_cEff_vs_pt_%s", cut2[hist2].c_str());
      h_cEff_vs_pt[hist2] = new TH1F(name, "cEff_vs_pt", n_eff_pt, Eff_bins_pt);
      h_cEff_vs_pt[hist2]->GetYaxis()->SetTitle("c jet misidentification probability");     h_cEff_vs_pt[hist2]->GetYaxis()->CenterTitle();
      h_cEff_vs_pt[hist2]->GetXaxis()->SetTitle("P_{T}^{Jet} (GeV)");    h_cEff_vs_pt[hist2]->GetXaxis()->CenterTitle();
      h_cEff_vs_pt[hist2]->Sumw2();

      sprintf(name, "h_udsgEff_vs_pt_%s", cut2[hist2].c_str());
      h_udsgEff_vs_pt[hist2] = new TH1F(name, "udsgEff_vs_pt", n_eff_pt, Eff_bins_pt);
      h_udsgEff_vs_pt[hist2]->GetYaxis()->SetTitle("udsg jet misidentification probability");     h_udsgEff_vs_pt[hist2]->GetYaxis()->CenterTitle();
      h_udsgEff_vs_pt[hist2]->GetXaxis()->SetTitle("P_{T}^{Jet} (GeV)");    h_udsgEff_vs_pt[hist2]->GetXaxis()->CenterTitle();
      h_udsgEff_vs_pt[hist2]->Sumw2();

      sprintf(name, "h_bEff_vs_eta_%s", cut2[hist2].c_str());
      h_bEff_vs_eta[hist2] = new TH1F(name, "bEff_vs_eta", 100, -2.5, 2.5);
      h_bEff_vs_eta[hist2]->GetYaxis()->SetTitle("b jet efficiency");     h_bEff_vs_eta[hist2]->GetYaxis()->CenterTitle();
      h_bEff_vs_eta[hist2]->GetXaxis()->SetTitle("{#eta}^{Jet}");    h_bEff_vs_eta[hist2]->GetXaxis()->CenterTitle();
      h_bEff_vs_eta[hist2]->Sumw2();

      sprintf(name, "h_cEff_vs_eta_%s", cut2[hist2].c_str());
      h_cEff_vs_eta[hist2] = new TH1F(name, "cEff_vs_eta", 100, -2.5, 2.5);
      h_cEff_vs_eta[hist2]->GetYaxis()->SetTitle("c jet misidentification probability");     h_cEff_vs_eta[hist2]->GetYaxis()->CenterTitle();
      h_cEff_vs_eta[hist2]->GetXaxis()->SetTitle("{#eta}^{Jet}");    h_cEff_vs_eta[hist2]->GetXaxis()->CenterTitle();
      h_cEff_vs_eta[hist2]->Sumw2();

      sprintf(name, "h_udsgEff_vs_eta_%s", cut2[hist2].c_str());
      h_udsgEff_vs_eta[hist2] = new TH1F(name, "udsgEff_vs_eta", 100, -2.5, 2.5);
      h_udsgEff_vs_eta[hist2]->GetYaxis()->SetTitle("udsg jet misidentification probability");     h_udsgEff_vs_eta[hist2]->GetYaxis()->CenterTitle();
      h_udsgEff_vs_eta[hist2]->GetXaxis()->SetTitle("{#eta}^{Jet}");    h_udsgEff_vs_eta[hist2]->GetXaxis()->CenterTitle();
      h_udsgEff_vs_eta[hist2]->Sumw2();

    }


    h_PU_EvtWt = new TH1F("h_PU_EvtWt", "PileUp evts wts", 1000, 0, 100);
    h_PU_EvtWt->GetYaxis()->SetTitle("Events");   h_PU_EvtWt->GetYaxis()->CenterTitle();
    h_PU_EvtWt->GetXaxis()->SetTitle("PU_Wt");    h_PU_EvtWt->GetXaxis()->CenterTitle();
    h_PU_EvtWt->Sumw2();

    h_PreBTag_EvtWt = new TH1F("h_PreBTag_EvtWt", "PreBtag evts wts", 1000, 0, 100);
    h_PreBTag_EvtWt->GetYaxis()->SetTitle("Events");   h_PreBTag_EvtWt->GetYaxis()->CenterTitle();
    h_PreBTag_EvtWt->GetXaxis()->SetTitle("Lumi+PU_Wt");    h_PreBTag_EvtWt->GetXaxis()->CenterTitle();
    h_PreBTag_EvtWt->Sumw2();

    h_bTag_SF = new TH1F("h_bTag_SF", "BTag SF Dist", 150, 0, 1.5);
    h_bTag_SF->GetYaxis()->SetTitle("Events");     h_bTag_SF->GetYaxis()->CenterTitle();
    h_bTag_SF->GetXaxis()->SetTitle("BTag_SF");    h_bTag_SF->GetXaxis()->CenterTitle();
    h_bTag_SF->Sumw2();

    h_bTag_EvtWt_1Tag = new TH1F("h_bTag_EvtWt_1Tag", "1 BTag evt wts", 400, -2, 2);
    h_bTag_EvtWt_1Tag->GetYaxis()->SetTitle("Events");     h_bTag_EvtWt_1Tag->GetYaxis()->CenterTitle();
    h_bTag_EvtWt_1Tag->GetXaxis()->SetTitle("BTag_Wt");    h_bTag_EvtWt_1Tag->GetXaxis()->CenterTitle();
    h_bTag_EvtWt_1Tag->Sumw2();

    h_bTag_EvtWt_0Tag = new TH1F("h_bTag_EvtWt_0Tag", "0 BTag evt wts", 400, -2, 2);
    h_bTag_EvtWt_0Tag->GetYaxis()->SetTitle("Events");     h_bTag_EvtWt_0Tag->GetYaxis()->CenterTitle();
    h_bTag_EvtWt_0Tag->GetXaxis()->SetTitle("BTag_Wt");    h_bTag_EvtWt_0Tag->GetXaxis()->CenterTitle();
    h_bTag_EvtWt_0Tag->Sumw2();

    //Pileup
    h_trueNumofInt = new TH1F("h_trueNumofInt","True Num of Interactions", 50, 0, 50);
    h_trueNumofInt->GetYaxis()->SetTitle("Events");   h_trueNumofInt->GetYaxis()->CenterTitle();
    h_trueNumofInt->GetXaxis()->SetTitle("nPV");      h_trueNumofInt->GetXaxis()->CenterTitle();
    h_trueNumofInt->Sumw2();

    h_goodPV_noWt = new TH1F("h_goodPV_noWt","No. of Good Primary Vertices", 50, 0, 50);
    h_goodPV_noWt->GetYaxis()->SetTitle("Events");   h_goodPV_noWt->GetYaxis()->CenterTitle();
    h_goodPV_noWt->GetXaxis()->SetTitle("nPV");      h_goodPV_noWt->GetXaxis()->CenterTitle();
    h_goodPV_noWt->Sumw2();

    h_goodPV_LumiWt = new TH1F("h_goodPV_LumiWt","No. of Good Primary Vertices", 50, 0, 50);
    h_goodPV_LumiWt->GetYaxis()->SetTitle("Events");   h_goodPV_LumiWt->GetYaxis()->CenterTitle();
    h_goodPV_LumiWt->GetXaxis()->SetTitle("nPV");      h_goodPV_LumiWt->GetXaxis()->CenterTitle();
    h_goodPV_LumiWt->Sumw2();

    h_goodPV_PUWt = new TH1F("h_goodPV_PUWt","No. of Good Primary Vertices", 50, 0, 50);
    h_goodPV_PUWt->GetYaxis()->SetTitle("Events");   h_goodPV_PUWt->GetYaxis()->CenterTitle();
    h_goodPV_PUWt->GetXaxis()->SetTitle("nPV");      h_goodPV_PUWt->GetXaxis()->CenterTitle();
    h_goodPV_PUWt->Sumw2();

    h_goodPV_LumiWt_noMassCut = new TH1F("h_goodPV_LumiWt_noMassCut","No. of Good Primary Vertices", 50, 0, 50);
    h_goodPV_LumiWt_noMassCut->GetYaxis()->SetTitle("Events");   h_goodPV_LumiWt_noMassCut->GetYaxis()->CenterTitle();
    h_goodPV_LumiWt_noMassCut->GetXaxis()->SetTitle("nPV");      h_goodPV_LumiWt_noMassCut->GetXaxis()->CenterTitle();
    h_goodPV_LumiWt_noMassCut->Sumw2();

    //Position of photon and jet
    h_PC = new TH1F("h_PC", "Photon Candidate", 10, 0, 10);
    h_PC->GetYaxis()->SetTitle("Events");                       h_PC->GetYaxis()->CenterTitle();
    h_PC->GetXaxis()->SetTitle("Position of Photon");           h_PC->GetXaxis()->CenterTitle();
    h_PC->Sumw2();
		 
    h_JC = new TH1F("h_JC", "Jet Candidate", 20, 0, 20);
    h_JC->GetYaxis()->SetTitle("Events");                       h_JC->GetYaxis()->CenterTitle();
    h_JC->GetXaxis()->SetTitle("Position of Jet");              h_JC->GetXaxis()->CenterTitle();
    h_JC->Sumw2();

    //Pileup Reweighting
    h_DataPUNormDist = new TH1F("h_DataPUNormDist", "Normalized Data PileUp Distribution", 50, 0, 50);
    h_DataPUNormDist->GetYaxis()->SetTitle("Events");           h_DataPUNormDist->GetYaxis()->CenterTitle();
    h_DataPUNormDist->GetXaxis()->SetTitle("nPUV");             h_DataPUNormDist->GetXaxis()->CenterTitle();
    h_DataPUNormDist->Sumw2();
  
    h_MCPUNormDist = new TH1F("h_MCPUNormDist", "Normalized MC PileUp Distribution",50, 0, 50);
    h_MCPUNormDist->GetYaxis()->SetTitle("Events");             h_MCPUNormDist->GetYaxis()->CenterTitle();
    h_MCPUNormDist->GetXaxis()->SetTitle("nPUV");               h_MCPUNormDist->GetXaxis()->CenterTitle();
    h_MCPUNormDist->Sumw2();
  
    h_PUScaleFactor = new TH1F("h_PUScaleFactor", "PileUp Scale Factors Distribution", 50, 0, 50);
    h_PUScaleFactor->GetYaxis()->SetTitle("SF");      h_PUScaleFactor->GetYaxis()->CenterTitle();
    h_PUScaleFactor->GetXaxis()->SetTitle("nPUV");              h_PUScaleFactor->GetXaxis()->CenterTitle();
    h_PUScaleFactor->Sumw2();
		 		 
    //Defining the histogram from filling number of events after various cuts
    const int nbins_qstar = 12;
    const int nbins_bstar = 16;
    const int nbinsWt_qstar = 12;
    const int nbinsWt_bstar = 16;
    const int nbinsTotalWt_bstar = 16;
    const int nbinsErr = 14;

    TString CutFlowLabels_qstar[nbins_qstar] = {"Total", "HLT", "PrimaryVtx", "PhotonID", "PhotonPtEta", "PhotonPtEta_AfterOverlapRemoval", "JetID", "JetPt", "JetEta", "DPhi", "DEta", "MassCut"};
  TString CutFlowLabels_bstar[nbins_bstar] = {"Total", "HLT", "PrimaryVtx", "PhotonID", "PhotonPtEta", "JetID", "JetPt", "JetEta", "1BTag", "1BTag_DPhi", "1BTag_DEta", "1BTag_MassCut", "0BTag", "0BTag_DPhi", "0BTag_DEta", "0BTag_MassCut"};
  TString CutFlowLabelsWt_qstar[nbinsWt_qstar] = {"Total", "HLT", "PrimaryVtx", "PhotonID", "PhotonPtEta", "PhotonPtEta_AfterOverlapRemoval", "JetID", "JetPt", "JetEta", "DPhi", "DEta", "MassCut"};
  TString CutFlowLabelsWt_bstar[nbinsWt_bstar] = {"Total", "HLT", "PrimaryVtx", "PhotonID", "PhotonPtEta", "JetID", "JetPt", "JetEta", "1BTag", "1BTag_DPhi", "1BTag_DEta", "1BTag_MassCut", "0BTag", "0BTag_DPhi", "0BTag_DEta", "0BTag_MassCut"};
  TString CutFlowLabelsTotalWt_bstar[nbinsTotalWt_bstar] = {"Total", "HLT", "PrimaryVtx", "PhotonID", "PhotonPtEta", "JetID", "JetPt", "JetEta", "1BTag", "1BTag_DPhi", "1BTag_DEta", "1BTag_MassCut", "0BTag", "0BTag_DPhi", "0BTag_DEta", "0BTag_MassCut"};
    TString CutFlowLabels_BTagSFerr[nbinsErr] = {"PassCSV_noMassCut", "1BTag_noMassCut_SF", "1BTag_noMassCut_SFup", "1BTag_noMassCut_SFdown", "0BTag_noMassCut_SF", "0BTag_noMassCut_SFup", "0BTag_noMassCut_SFdown", "PassCSV_MassCut", "1BTag_MassCut_SF", "1BTag_MassCut_SFup", "1BTag_MassCut_SFdown", "0BTag_MassCut_SF", "0BTag_MassCut_SFup", "0BTag_MassCut_SFdown"};

    h_CutFlow_qstar = new TH1F("h_CutFlow_qstar", "Events Passing Various Cuts for qstar", nbins_qstar, 0, nbins_qstar);
    h_CutFlow_qstar->GetYaxis()->SetTitle("Events");         h_CutFlow_qstar->GetYaxis()->CenterTitle();
    for(int i = 0; i < nbins_qstar; i++){
      h_CutFlow_qstar->GetXaxis()->SetBinLabel(i+1, CutFlowLabels_qstar[i]);
    }

    h_CutFlow_bstar = new TH1F("h_CutFlow_bstar", "Events Passing Various Cuts for bstar", nbins_bstar, 0, nbins_bstar);
    h_CutFlow_bstar->GetYaxis()->SetTitle("Events");         h_CutFlow_bstar->GetYaxis()->CenterTitle();
    for(int i = 0; i < nbins_bstar; i++){
      h_CutFlow_bstar->GetXaxis()->SetBinLabel(i+1, CutFlowLabels_bstar[i]);
    }

    h_CutFlowWt_qstar = new TH1F("h_CutFlowWt_qstar", "Events Passing Various Cuts for qstar", nbinsWt_qstar, 0, nbinsWt_qstar);
    h_CutFlowWt_qstar->GetYaxis()->SetTitle("Events");         h_CutFlowWt_qstar->GetYaxis()->CenterTitle();
    for(int i = 0; i < nbinsWt_qstar; i++){
      h_CutFlowWt_qstar->GetXaxis()->SetBinLabel(i+1, CutFlowLabelsWt_qstar[i]);
    }

    h_CutFlowWt_bstar = new TH1F("h_CutFlowWt_bstar", "Events Passing Various Cuts for bstar", nbinsWt_bstar, 0, nbinsWt_bstar);
    h_CutFlowWt_bstar->GetYaxis()->SetTitle("Events");         h_CutFlowWt_bstar->GetYaxis()->CenterTitle();
    for(int i = 0; i < nbinsWt_bstar; i++){
      h_CutFlowWt_bstar->GetXaxis()->SetBinLabel(i+1, CutFlowLabelsWt_bstar[i]);
    }

    h_CutFlowTotalWt_bstar = new TH1F("h_CutFlowTotalWt_bstar", "Events Passing Various Cuts for bstar with btag wt", nbinsTotalWt_bstar, 0, nbinsTotalWt_bstar);
    h_CutFlowTotalWt_bstar->GetYaxis()->SetTitle("Events");         h_CutFlowTotalWt_bstar->GetYaxis()->CenterTitle();
    for(int i = 0; i < nbinsTotalWt_bstar; i++){
      h_CutFlowTotalWt_bstar->GetXaxis()->SetBinLabel(i+1, CutFlowLabelsTotalWt_bstar[i]);
    }

    h_CutFlow_BTagSFerr = new TH1F("h_CutFlow_BTagSFerr", "Events passing for different BTag SF errors", nbinsErr, 0, nbinsErr);
    h_CutFlow_BTagSFerr->GetYaxis()->SetTitle("Events");         h_CutFlow_BTagSFerr->GetYaxis()->CenterTitle();
    for(int i = 0; i < nbinsErr; i++){
      h_CutFlow_BTagSFerr->GetXaxis()->SetBinLabel(i+1, CutFlowLabels_BTagSFerr[i]);
    }
}

#endif // #ifdef PostAnalyzer_MC_cxx




EOF

cat > analysis_${filenameTag}.C <<EOF
#include "PostAnalyzer_MC.C"
#include "TROOT.h"
int main(){
    PostAnalyzer_MC a;
    a.Loop();
    return 0;
}

EOF

####Compilation
g++ -Wno-deprecated analysis_${filenameTag}.C /uscms_data/d3/rocky86/13TeV/PostAnalyzer_2015+2016/PostAnalyzer_80X/PostAnalyzer_MC/PA_Main/BtagSF/BTagCalibrationStandalone.o -o ${filenameTag}.exe -I$ROOTSYS/include -L$ROOTSYS/lib `root-config --cflags` `root-config --libs`

####Execution
##./${filenameTag}.exe


###Submit jobs

chmod 775 MakeCondorFiles_local.csh

./MakeCondorFiles_local.csh ${filenameTag}


end ##end of foreach i loop##
end ##end of foreach case loop##