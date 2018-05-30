#!/bin/tcsh

################################################################
## Postanalyzer for q* -> gamma + q study at 13 TeV
## author : Varun Sharma
## Email : varun.sharma@cern.ch
################################################################

setenv pwd $PWD

set isM = 1 ## set 1 for MC
set isD = 0 ## set 1 for Data
#-----------------------------------------------------------

## 0=Qstarf1p0,  1=Qstarf0p5,  2=Qstarf0p1, 5 = TESTING
foreach runCase ( 0 1 2)
#foreach runCase ( 5)

set sampleIndex = 0

setenv OutEos /eos/uscms/store/user/varun/work/13TeV/QstarGJ/PostAnalyzer/Pt190jetEta2p4dphi2p5dEta2p0M560LID_2p2fb
if( ! -d ${OutEos}) then
mkdir -pv ${OutEos}
endif

###----------------------------------------------------------------------------------------------------
if( ${runCase} == 0 ) then
echo "******** Running for Signal -- Qstar, f=1.0 ***********"
setenv tmp QstarToGJ_
foreach i (${tmp}M500_f1p0 ${tmp}M1000_f1p0 ${tmp}M2000_f1p0 ${tmp}M3000_f1p0 ${tmp}M4000_f1p0 ${tmp}M5000_f1p0 ${tmp}M6000_f1p0 ${tmp}M7000_f1p0 ${tmp}M8000_f1p0 ${tmp}M9000_f1p0)
set XS = ( 3.033E2         1.632E1          5.213E-1         4.272E-2         4.8E-3           5.835E-4         7.076E-5         8.66E-6          1.283E-6         2.985E-7 )
set totEvnts = (298953     299072           100000           74879            74271            74802            74822            49544            49628            50000 )
set massNrm  = (500.0      1000.0           2000.0           3000.0           4000.0           5000.0           6000.0           7000.0           8000.0           9000.0)   
setenv sourceDir /eos/uscms/store/user/lpcqstar/13TeV/NTuples/MC/Signal_Qstar/${i}/
setenv OutPath ${OutEos}/Interpolation_Qstarf1p0
set filesPerJob = 1000 ## Total files : max
endif
##
###----------------------------------------------------------------------------------------------------
if( ${runCase} == 1 ) then
echo "******** Running for Signal -- Qstar, f=0.5 ***********"
setenv tmp QstarToGJ_
foreach i (${tmp}M500_f0p5 ${tmp}M1000_f0p5 ${tmp}M2000_f0p5 ${tmp}M3000_f0p5 ${tmp}M4000_f0p5 ${tmp}M5000_f0p5 ${tmp}M6000_f0p5 ${tmp}M7000_f0p5 ${tmp}M8000_f0p5 ${tmp}M9000_f0p5)
set XS = ( 7.378E1         4.129E0          1.328E-1         1.095E-2         1.212E-3          1.437E-4        1.62E-5          1.672E-6         1.647E-7         2.329E-8)
set totEvnts = (297624     97970            98740            74232            74857             74896           74328            49888            48200            49403)
set massNrm  = (500.0      1000.0           2000.0           3000.0           4000.0           5000.0           6000.0           7000.0           8000.0           9000.0)   
setenv sourceDir /eos/uscms/store/user/lpcqstar/13TeV/NTuples/MC/Signal_Qstar/${i}/
setenv OutPath ${OutEos}/Interpolation_Qstarf0p5
set filesPerJob = 1000 ## Total files : max
endif
##
###----------------------------------------------------------------------------------------------------
if( ${runCase} == 2 ) then
echo "******** Running for Signal -- Qstar, f=0.1 ***********"
setenv tmp QstarToGJ_
foreach i (${tmp}M500_f0p1 ${tmp}M1000_f0p1 ${tmp}M2000_f0p1 ${tmp}M3000_f0p1 ${tmp}M4000_f0p1 ${tmp}M5000_f0p1 ${tmp}M6000_f0p1 ${tmp}M7000_f0p1 ${tmp}M8000_f0p1 ${tmp}M9000_f0p1)
set XS = ( 2.955E0         1.655E-1         5.315E-3         4.356E-4         4.861E-5         5.715E-6         6.241E-7         5.973E-8         4.515E-9         2.655E-10   )
set totEvnts = (97208      98290            73128            74286 	      74836            75000            49918            49679            49316            49782 )
set massNrm  = (500.0      1000.0           2000.0           3000.0           4000.0           5000.0           6000.0           7000.0           8000.0           9000.0)   
setenv sourceDir /eos/uscms/store/user/lpcqstar/13TeV/NTuples/MC/Signal_Qstar/${i}/
setenv OutPath ${OutEos}/Interpolation_Qstarf0p1
set filesPerJob = 1000 ## Total files : max
endif
##
###----------------------------------------------------------------------------------------------------
###----------------------------------------------------------------------------------------------------
if( ${runCase} == 5 ) then
echo "******** Running for Testing -- Qstar, f=1.0 ***********"
setenv tmp QstarToGJ_
foreach i ( ${tmp}M1000_f1p0 )
set XS = (      1.632E1      )
set totEvnts = (299072       )
set massNrm  = (1000.0       )    
setenv sourceDir /eos/uscms/store/user/lpcqstar/13TeV/NTuples/MC/Signal_Qstar/${i}/
setenv OutPath ${OutEos}/Test_Qstarf1p0
set filesPerJob = 20 ## Total files : max
endif
##
###----------------------------------------------------------------------------------------------------
if( ! -d ${OutPath}) then
echo "--------- Making Directory ${OutPath} -----------"
mkdir -pv ${OutPath}
chmod 775 ${OutPath}                                                                                                                                                           
endif

setenv FileNameTag ${i}

@ sampleIndex = ${sampleIndex} + 1


##_______________________________________________________________________________
## Read each file in the directory and submit seperate job for each file OR
## merge "r" files to submit one job
##-----------------------------------------------------------------
       
#Fill the range for input to code e.g 1-10 then r = 10
set r = ${filesPerJob}
set sf = 1          ## start file
set ef = ${r}       ## end file
 
ls -1 ${sourceDir} > ${FileNameTag}_dataset.txt
 
setenv datafile  ${FileNameTag}_dataset.txt
set file_length=`wc -l $datafile | cut -c1-4`     # Count Lines i.e. no. of files in dir
set p = 0
 
set Tot = ${file_length}
#set Tot = 1
 
#run till the last line of the input files
while (${sf} <= ${Tot})
 
@ p = ${p} + 1
set DataName=`tail -n +$p ${datafile} | head -1`  # Get name of dataset
 
#####More changes in constructor, in the outputfile and at the end of file--------------------------------


cat>PhoJet_Analyzer_MC.C<<EOF
#define PhoJet_Analyzer_MC_cxx
#include "PhoJet_Analyzer_MC.h"
#include <TH2.h>
#include <TStyle.h>
#include <TCanvas.h>

using namespace std;
using namespace ROOT;

int main()
{
    gROOT->ProcessLine("#include <vector>");
    gROOT->ProcessLine("#include <map>");
    PhoJet_Analyzer_MC a;
    a.Loop();

}

void PhoJet_Analyzer_MC::Loop()
{

    //----------------------------------------------------------------
    // Give values for all cuts at the beginning
    //----------------------------------------------------------------
    // Luminosity
    Lumi = 2197.327; // pb^-1
    isMC = ${isM};
    isDATA = ${isD};

    // Fiducial Cuts
    cut_photonPt  = 190.0;  // (GeV)
    cut_photonEta = 1.4442; 

    cut_jetPt     = 190.0;  // (GeV)
    cut_jetEta    = 2.4;

    cut_gjDPhi = 2.5;
    cut_gjDEta = 2.0;

    cut_gjMass = 560.0;

    //Output File :
    //f1 = new TFile("test_Out.root", "recreate");
    TString OutputFile = "${FileNameTag}_${p}";
    TString OutputPath = "${OutPath}/";
    f1 = new TFile(OutputPath+OutputFile+".root","recreate");
    //  f1 = new TFile("${OutPath}/"+"${FileNameTag}_${p}"+".root", "recreate");
    f1->cd();
    //-------------------------------------------------------------------  



    if (fChain == 0) return;
    Long64_t nentries = fChain->GetEntriesFast();
    Long64_t nbytes = 0, nb = 0;
    std::cout<< " Will Analyze = " << nentries << " events" <<std::endl;

    BookHistos();
    // if(isMC) LumiReWeighting();

    for (Long64_t jentry=0; jentry<nentries;jentry++) {
	Long64_t ientry = LoadTree(jentry);
	if (ientry < 0) break;
	nb = fChain->GetEntry(jentry);   nbytes += nb;

	if(isMC)   EvtWeight = Lumi*($XS[${sampleIndex}]/$totEvnts[${sampleIndex}].0);
	if(isDATA) EvtWeight = 1;

	PC = -1;
	JC = -1;
	goodVertex = 0;

	Bool_t passHLT, primaryVtx;
	primaryVtx  = PrimaryVertex(goodVertex);

	//++++++++++++++++++++++++++++++++ PHOTON SELECTION ++++++++++++++++++++++++++++++++++++++++
	// Selecting photon candidate using loose/medium/tight photon ID.
	foundIsoPhoton.clear();
	for(int ipho=0; ipho<nPho; ++ipho){
	    if(CutBasedPFPhotonID(ipho, "medium") )
		foundIsoPhoton.push_back(ipho);
	}

	foundPhoton.clear();
	for( int isoPho = 0; isoPho < foundIsoPhoton.size(); ++isoPho){
	    if( (*phoEt)[foundIsoPhoton[isoPho]] > cut_photonPt  && fabs((*phoSCEta)[foundIsoPhoton[isoPho]]) < cut_photonEta)
		foundPhoton.push_back(foundIsoPhoton[isoPho]);
	}
	if(foundPhoton.size() != 0)PC = foundPhoton[0];

	// ++++++++++++++++++++++++++++++++++++= JET SELECTION ++++++++++++++++++++++++++++++++
	// Selecting Jet candidate using tight Jet ID
	foundJet.clear();
	if(foundPhoton.size() != 0){
	    for(int ijet=0; ijet<nJet; ++ijet){
		if( getDR((*phoSCEta)[PC], (*jetEta)[ijet], (*phoSCPhi)[PC], (*jetPhi)[ijet] ) > 0.5 && jetID(ijet) )
		    foundJet.push_back(ijet);
	    }
	}
	if(foundJet.size() != 0)JC = foundJet[0];

	Bool_t c_jetPtEta = ( (*jetPt)[JC] > cut_jetPt  && fabs((*jetEta)[JC]) < cut_jetEta );
	Bool_t c_gjDPhi = (getDPhi( (*phoSCPhi)[PC], (*jetPhi)[JC] ) > cut_gjDPhi) ;
	Bool_t c_gjDEta = (getDEta( (*phoSCEta)[PC], (*jetEta)[JC] ) < cut_gjDEta) ;

	Bool_t c_InvMass  = ( getMass(PC,JC) > cut_gjMass );



	h_CutFlow->Fill(0.5);
	h_CutExpFlow->Fill(0.5,EvtWeight);

	if(passHLT || isMC ){
	    h_CutFlow->Fill(1.5);
	    h_CutExpFlow->Fill(1.5,EvtWeight);

	    if(primaryVtx){
		h_CutFlow->Fill(2.5);
		h_CutExpFlow->Fill(2.5,EvtWeight);

		if(foundIsoPhoton.size() > 0){
		    h_CutFlow->Fill(3.5);
		    h_CutExpFlow->Fill(3.5,EvtWeight);

		    if(PC > -1){
			h_CutFlow->Fill(4.5);
			h_CutExpFlow->Fill(4.5,EvtWeight);

			if(JC > -1){
			    h_CutFlow->Fill(5.5);
			    h_CutExpFlow->Fill(5.5,EvtWeight);

			    if(c_jetPtEta){
				h_CutFlow->Fill(6.5);
				h_CutExpFlow->Fill(6.5,EvtWeight);

				if(c_gjDPhi){
				    h_CutFlow->Fill(7.5);
				    h_CutExpFlow->Fill(7.5,EvtWeight);

				    if(c_gjDEta){
					h_CutFlow->Fill(8.5);
					h_CutExpFlow->Fill(8.5,EvtWeight);

					h_mass_X_bin1 ->Fill(getMass(PC,JC)/$massNrm[${sampleIndex}], EvtWeight);
					if(c_InvMass){
					    h_CutFlow->Fill(9.5);
					    h_CutExpFlow->Fill(9.5,EvtWeight);

					    h_mass_VarBin ->Fill(getMass(PC,JC), EvtWeight);
					    h_mass_bin1   ->Fill(getMass(PC,JC), EvtWeight);

					    if( pfMET < 500){
						h_CutFlow->Fill(10.5);
						h_CutExpFlow->Fill(10.5,EvtWeight);

						if( pfMET < 250){
						    h_CutFlow->Fill(11.5);
						    h_CutExpFlow->Fill(11.5,EvtWeight);

						    if( pfMET < 100){
							h_CutFlow->Fill(12.5);
							h_CutExpFlow->Fill(12.5,EvtWeight);

							if( pfMET < 50){
							    h_CutFlow->Fill(13.5);
							    h_CutExpFlow->Fill(13.5,EvtWeight);

							}//--MET50
						    }//--MET100
						}//--MET250
					    }//--MET500
					}//--c_InvMass
				    }//--c_gjDEta
				}//--c_gjDPhi
			    }//--c_jetPtEta
			}//--JC
		    }//--PC
		}//--foundIsoPhoton
	    }//--primaryVtx
	}//--passHLT

    }//-- jentry for loop

    //WriteHistos(); 
}// -- Loop()
EOF
##################################################
###---------- .C File ends --------------------###

cat>PhoJet_Analyzer_MC.h<<EOF
//////////////////////////////////////////////////////////
// This class has been automatically generated on
// Tue Oct 20 08:45:05 2015 by ROOT version 6.02/05
// from TTree EventTree/Event data
// found on file: /eos/uscms/store/user/lpcqstar/13TeV/NTuples/MC/Signal_Qstar/QstarToGJ_M1000_f0p1/AOD_QstarToGJ_M1000_f0p1_1.root
//////////////////////////////////////////////////////////

#ifndef PhoJet_Analyzer_MC_h
#define PhoJet_Analyzer_MC_h

#include <TROOT.h>
#include <TChain.h>
#include <TFile.h>
#include <TTree.h>
#include <TBranch.h>
#include "TH1.h"
#include "TH2.h"
#include <TMinuit.h>
#include <TRandom.h>
#include <string>
#include <iostream>
#include <fstream>
#include <TMath.h>
#include <stdio.h>
#include <TString.h>
#include <TH1F.h>
#include <TH2F.h>
#include <TH1D.h>
#include <TH2D.h>
#include <TH1I.h>
#include <TSystemFile.h>
#include <TSystemDirectory.h>
#include <TDCacheFile.h>
#include <TCanvas.h>
#include <TLegend.h>
#include <TList.h>
#include <Riostream.h> 
#include <TGraphAsymmErrors.h>
#include <map>
#include "TRFIOFile.h"
#include "TMath.h"
#include <vector>
#include <TList.h>
#include <Riostream.h>
#include <set>
#include "TKDE.h"
#include <TLorentzVector.h>

#ifdef __MAKECINT__ 
#pragma link C++ class vector<bool>+;
#pragma link C++ class map<TString,TH1D*>+;
#pragma link C++ class vector<unsigned long long>+;
#pragma link C++ class vector<vector<unsigned long long> >+;
#pragma link C++ class vector<ULong64_t>+;
#pragma link C++ class vector<vector<ULong64_t> >+;
#pragma link C++ class vector<long long>+;
#pragma link C++ class vector<vector<long long> >+;
#pragma link C++ class vector<Long64_t>+;
#pragma link C++ class vector<vector<Long64_t> >+;
#endif

using namespace std;        
using namespace ROOT;


class PhoJet_Analyzer_MC {
    public :
	TTree          *fChain;   //!pointer to the analyzed TTree or TChain
	Int_t           fCurrent; //!current Tree number in a TChain

	// Variables defined by me :
	TFile *f1;

	Bool_t isMC, isDATA;
	Bool_t _debug;

	Double_t EvtWeight;
	Double_t Lumi;

	Double_t cut_photonPt;
	Double_t cut_photonEta;
	Double_t cut_jetPt;
	Double_t cut_jetEta;

	Double_t cut_gjDPhi;
	Double_t cut_gjDEta;

	Double_t cut_gjMass;

	std::vector<int> foundIsoPhoton;
	std::vector<int> foundPhoton;
	std::vector<int> foundJet;

	Int_t goodVertex;
	Int_t PC;
	Int_t JC;

	// Declare user defined histograms below :
	TH1F * h_CutFlow;
	TH1F * h_CutExpFlow;

	TH1F * h_mass_VarBin;
	TH1F * h_mass_bin1;
	TH1F * h_mass_X_bin1;

	// Fixed size dimensions of array or collections stored in the TTree if any.

	// Declaration of leaf types
	Int_t           run;
	Long64_t        event;
	Int_t           lumis;
	Bool_t          isData;
	Int_t           nVtx;
	vector<int>     *nTrksPV;
	vector<float>   *vtx;
	vector<float>   *vty;
	vector<float>   *vtz;
	vector<float>   *vrho;
	vector<int>     *vndof;
	vector<float>   *vchi2;
	vector<bool>    *isFake;
	Float_t         rho;
	Float_t         rhoCentral;
	ULong64_t       HLTEleMuX;
	ULong64_t       HLTPho;
	ULong64_t       HLTJet;
	ULong64_t       HLTEleMuXIsPrescaled;
	ULong64_t       HLTPhoIsPrescaled;
	ULong64_t       HLTJetIsPrescaled;
	vector<float>   *pdf;
	Float_t         pthat;
	Float_t         processID;
	Float_t         genWeight;
	Int_t           nPUInfo;
	vector<int>     *nPU;
	vector<int>     *puBX;
	vector<float>   *puTrue;
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
	Int_t           metFilters;
	Float_t         genMET;
	Float_t         genMETPhi;
	Float_t         pfMET;
	Float_t         pfMETPhi;
	Float_t         pfMETsumEt;
	Float_t         pfMETmEtSig;
	Float_t         pfMETSig;
	Float_t         pfMET_T1JERUp;
	Float_t         pfMET_T1JERDo;
	Float_t         pfMET_T1JESUp;
	Float_t         pfMET_T1JESDo;
	Float_t         pfMET_T1MESUp;
	Float_t         pfMET_T1MESDo;
	Float_t         pfMET_T1EESUp;
	Float_t         pfMET_T1EESDo;
	Float_t         pfMET_T1PESUp;
	Float_t         pfMET_T1PESDo;
	Float_t         pfMET_T1TESUp;
	Float_t         pfMET_T1TESDo;
	Float_t         pfMET_T1UESUp;
	Float_t         pfMET_T1UESDo;
	Int_t           nPho;
	vector<float>   *phoE;
	vector<float>   *phoEt;
	vector<float>   *phoEta;
	vector<float>   *phoPhi;
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
	vector<float>   *phoSigmaIEtaIEta;
	vector<float>   *phoSigmaIEtaIPhi;
	vector<float>   *phoSigmaIPhiIPhi;
	vector<float>   *phoE1x3;
	vector<float>   *phoE2x2;
	vector<float>   *phoE2x5Max;
	vector<float>   *phoE5x5;
	vector<float>   *phoESEffSigmaRR;
	vector<float>   *phomaxXtalenergyFull5x5;
	vector<float>   *phoseedTimeFull5x5;
	vector<float>   *phomaxXtalenergy;
	vector<float>   *phoseedTime;
	vector<float>   *phoSigmaIEtaIEtaFull5x5;
	vector<float>   *phoSigmaIEtaIPhiFull5x5;
	vector<float>   *phoSigmaIPhiIPhiFull5x5;
	vector<float>   *phoE1x3Full5x5;
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
	vector<float>   *phoPFChIsoFrix1;
	vector<float>   *phoPFChIsoFrix2;
	vector<float>   *phoPFChIsoFrix3;
	vector<float>   *phoPFChIsoFrix4;
	vector<float>   *phoPFChIsoFrix5;
	vector<float>   *phoPFChIsoFrix6;
	vector<float>   *phoPFChIsoFrix7;
	vector<float>   *phoPFChIsoFrix8;
	vector<float>   *phoPFPhoIsoFrix1;
	vector<float>   *phoPFPhoIsoFrix2;
	vector<float>   *phoPFPhoIsoFrix3;
	vector<float>   *phoPFPhoIsoFrix4;
	vector<float>   *phoPFPhoIsoFrix5;
	vector<float>   *phoPFPhoIsoFrix6;
	vector<float>   *phoPFPhoIsoFrix7;
	vector<float>   *phoPFPhoIsoFrix8;
	vector<float>   *phoPFNeuIsoFrix1;
	vector<float>   *phoPFNeuIsoFrix2;
	vector<float>   *phoPFNeuIsoFrix3;
	vector<float>   *phoPFNeuIsoFrix4;
	vector<float>   *phoPFNeuIsoFrix5;
	vector<float>   *phoPFNeuIsoFrix6;
	vector<float>   *phoPFNeuIsoFrix7;
	vector<float>   *phoPFNeuIsoFrix8;
	vector<float>   *phoEcalRecHitSumEtConeDR03;
	vector<float>   *phohcalDepth1TowerSumEtConeDR03;
	vector<float>   *phohcalDepth2TowerSumEtConeDR03;
	vector<float>   *phohcalTowerSumEtConeDR03;
	vector<float>   *photrkSumPtHollowConeDR03;
	vector<float>   *phoIDMVA;
	vector<int>     *phoFiredSingleTrgs;
	vector<int>     *phoFiredDoubleTrgs;
	vector<unsigned short> *phoIDbit;
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
	vector<float>   *elePt;
	vector<float>   *eleEta;
	vector<float>   *elePhi;
	vector<float>   *eleR9;
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
	vector<float>   *eleSigmaIEtaIEta;
	vector<float>   *eleSigmaIEtaIPhi;
	vector<float>   *eleSigmaIPhiIPhi;
	vector<float>   *eleSigmaIEtaIEtaFull5x5;
	vector<float>   *eleSigmaIPhiIPhiFull5x5;
	vector<int>     *eleConvVeto;
	vector<int>     *eleMissHits;
	vector<float>   *eleESEffSigmaRR;
	vector<float>   *elePFChIso;
	vector<float>   *elePFPhoIso;
	vector<float>   *elePFNeuIso;
	vector<float>   *elePFPUIso;
	vector<float>   *eleIDMVANonTrg;
	vector<float>   *eleIDMVATrg;
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
	vector<int>     *eleFiredTrgs;
	vector<unsigned short> *eleIDbit;
	vector<float>   *eleESEnP1Raw;
	vector<float>   *eleESEnP2Raw;
	Int_t           nGSFTrk;
	vector<float>   *gsfPt;
	vector<float>   *gsfEta;
	vector<float>   *gsfPhi;
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
	vector<bool>    *muIsLooseID;
	vector<bool>    *muIsMediumID;
	vector<bool>    *muIsTightID;
	vector<bool>    *muIsSoftID;
	vector<bool>    *muIsHighPtID;
	vector<float>   *muD0;
	vector<float>   *muDz;
	vector<float>   *muChi2NDF;
	vector<float>   *muInnerD0;
	vector<float>   *muInnerDz;
	vector<int>     *muTrkLayers;
	vector<int>     *muPixelLayers;
	vector<int>     *muPixelHits;
	vector<int>     *muMuonHits;
	vector<int>     *muStations;
	vector<int>     *muTrkQuality;
	vector<float>   *muIsoTrk;
	vector<float>   *muPFChIso;
	vector<float>   *muPFPhoIso;
	vector<float>   *muPFNeuIso;
	vector<float>   *muPFPUIso;
	vector<int>     *muFiredTrgs;
	vector<float>   *muInnervalidFraction;
	vector<float>   *musegmentCompatibility;
	vector<float>   *muchi2LocalPosition;
	vector<float>   *mutrkKink;
	vector<float>   *muBestTrkPtError;
	vector<float>   *muBestTrkPt;
	Int_t           nTau;
	vector<bool>    *pfTausDiscriminationByDecayModeFinding;
	vector<bool>    *pfTausDiscriminationByDecayModeFindingNewDMs;
	vector<bool>    *tauByMVA5LooseElectronRejection;
	vector<bool>    *tauByMVA5MediumElectronRejection;
	vector<bool>    *tauByMVA5TightElectronRejection;
	vector<bool>    *tauByMVA5VTightElectronRejection;
	vector<bool>    *tauByLooseMuonRejection3;
	vector<bool>    *tauByTightMuonRejection3;
	vector<bool>    *tauByLooseCombinedIsolationDeltaBetaCorr3Hits;
	vector<bool>    *tauByMediumCombinedIsolationDeltaBetaCorr3Hits;
	vector<bool>    *tauByTightCombinedIsolationDeltaBetaCorr3Hits;
	vector<float>   *tauCombinedIsolationDeltaBetaCorrRaw3Hits;
	vector<bool>    *tauByVLooseIsolationMVA3oldDMwLT;
	vector<bool>    *tauByLooseIsolationMVA3oldDMwLT;
	vector<bool>    *tauByMediumIsolationMVA3oldDMwLT;
	vector<bool>    *tauByTightIsolationMVA3oldDMwLT;
	vector<bool>    *tauByVTightIsolationMVA3oldDMwLT;
	vector<bool>    *tauByVVTightIsolationMVA3oldDMwLT;
	vector<float>   *tauByIsolationMVA3oldDMwLTraw;
	vector<bool>    *tauByLooseIsolationMVA3newDMwLT;
	vector<bool>    *tauByVLooseIsolationMVA3newDMwLT;
	vector<bool>    *tauByMediumIsolationMVA3newDMwLT;
	vector<bool>    *tauByTightIsolationMVA3newDMwLT;
	vector<bool>    *tauByVTightIsolationMVA3newDMwLT;
	vector<bool>    *tauByVVTightIsolationMVA3newDMwLT;
	vector<float>   *tauByIsolationMVA3newDMwLTraw;
	vector<float>   *tauEta;
	vector<float>   *tauPhi;
	vector<float>   *tauPt;
	vector<float>   *tauEt;
	vector<float>   *tauCharge;
	vector<float>   *tauP;
	vector<float>   *tauPx;
	vector<float>   *tauPy;
	vector<float>   *tauPz;
	vector<float>   *tauVz;
	vector<float>   *tauEnergy;
	vector<float>   *tauMass;
	vector<float>   *tauDxy;
	vector<float>   *tauZImpact;
	vector<int>     *tauDecayMode;
	vector<bool>    *tauLeadChargedHadronExists;
	vector<float>   *tauLeadChargedHadronEta;
	vector<float>   *tauLeadChargedHadronPhi;
	vector<float>   *tauLeadChargedHadronPt;
	vector<float>   *tauChargedIsoPtSum;
	vector<float>   *tauNeutralIsoPtSum;
	vector<float>   *tauPuCorrPtSum;
	vector<float>   *tauNumSignalPFChargedHadrCands;
	vector<float>   *tauNumSignalPFNeutrHadrCands;
	vector<float>   *tauNumSignalPFGammaCands;
	vector<float>   *tauNumSignalPFCands;
	vector<float>   *tauNumIsolationPFChargedHadrCands;
	vector<float>   *tauNumIsolationPFNeutrHadrCands;
	vector<float>   *tauNumIsolationPFGammaCands;
	vector<float>   *tauNumIsolationPFCands;
	Int_t           nJet;
	vector<float>   *jetPt;
	vector<float>   *jetEn;
	vector<float>   *jetEta;
	vector<float>   *jetPhi;
	vector<float>   *jetRawPt;
	vector<float>   *jetRawEn;
	vector<float>   *jetArea;
	vector<float>   *jetpfCombinedInclusiveSecondaryVertexV2BJetTags;
	vector<float>   *jetJetProbabilityBJetTags;
	vector<float>   *jetpfCombinedMVABJetTags;
	vector<int>     *jetPartonID;
	vector<int>     *jetGenJetIndex;
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
	vector<bool>    *jetPFLooseId;
	vector<float>   *jetPUidFullDiscriminant;
	vector<float>   *jetJECUnc;
	vector<int>     *jetFiredTrgs;
	vector<float>   *jetCHF;
	vector<float>   *jetNHF;
	vector<float>   *jetCEF;
	vector<float>   *jetNEF;
	vector<int>     *jetNCH;
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
	vector<int>     *AK8Jetnconstituents;
	vector<bool>    *AK8JetPFLooseId;
	vector<float>   *AK8CHSSoftDropJetMass;
	vector<float>   *AK8JetpfBoostedDSVBTag;
	vector<float>   *AK8JetJECUnc;
	vector<int>     *AK8JetPartonID;
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
	vector<int>     *nAK8softdropSubjet;
	vector<vector<float> > *AK8softdropSubjetPt;
	vector<vector<float> > *AK8softdropSubjetEta;
	vector<vector<float> > *AK8softdropSubjetPhi;
	vector<vector<float> > *AK8softdropSubjetMass;
	vector<vector<float> > *AK8softdropSubjetE;
	vector<vector<int> > *AK8softdropSubjetCharge;
	vector<vector<int> > *AK8softdropSubjetFlavour;
	vector<vector<float> > *AK8softdropSubjetCSV;

	// List of branches
	TBranch        *b_run;   //!
	TBranch        *b_event;   //!
	TBranch        *b_lumis;   //!
	TBranch        *b_isData;   //!
	TBranch        *b_nVtx;   //!
	TBranch        *b_nTrksPV;   //!
	TBranch        *b_vtx;   //!
	TBranch        *b_vty;   //!
	TBranch        *b_vtz;   //!
	TBranch        *b_vrho;   //!
	TBranch        *b_vndof;   //!
	TBranch        *b_vchi2;   //!
	TBranch        *b_isFake;   //!
	TBranch        *b_rho;   //!
	TBranch        *b_rhoCentral;   //!
	TBranch        *b_HLTEleMuX;   //!
	TBranch        *b_HLTPho;   //!
	TBranch        *b_HLTJet;   //!
	TBranch        *b_HLTEleMuXIsPrescaled;   //!
	TBranch        *b_HLTPhoIsPrescaled;   //!
	TBranch        *b_HLTJetIsPrescaled;   //!
	TBranch        *b_pdf;   //!
	TBranch        *b_pthat;   //!
	TBranch        *b_processID;   //!
	TBranch        *b_genWeight;   //!
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
	TBranch        *b_metFilters;   //!
	TBranch        *b_genMET;   //!
	TBranch        *b_genMETPhi;   //!
	TBranch        *b_pfMET;   //!
	TBranch        *b_pfMETPhi;   //!
	TBranch        *b_pfMETsumEt;   //!
	TBranch        *b_pfMETmEtSig;   //!
	TBranch        *b_pfMETSig;   //!
	TBranch        *b_pfMET_T1JERUp;   //!
	TBranch        *b_pfMET_T1JERDo;   //!
	TBranch        *b_pfMET_T1JESUp;   //!
	TBranch        *b_pfMET_T1JESDo;   //!
	TBranch        *b_pfMET_T1MESUp;   //!
	TBranch        *b_pfMET_T1MESDo;   //!
	TBranch        *b_pfMET_T1EESUp;   //!
	TBranch        *b_pfMET_T1EESDo;   //!
	TBranch        *b_pfMET_T1PESUp;   //!
	TBranch        *b_pfMET_T1PESDo;   //!
	TBranch        *b_pfMET_T1TESUp;   //!
	TBranch        *b_pfMET_T1TESDo;   //!
	TBranch        *b_pfMET_T1UESUp;   //!
	TBranch        *b_pfMET_T1UESDo;   //!
	TBranch        *b_nPho;   //!
	TBranch        *b_phoE;   //!
	TBranch        *b_phoEt;   //!
	TBranch        *b_phoEta;   //!
	TBranch        *b_phoPhi;   //!
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
	TBranch        *b_phoSigmaIEtaIEta;   //!
	TBranch        *b_phoSigmaIEtaIPhi;   //!
	TBranch        *b_phoSigmaIPhiIPhi;   //!
	TBranch        *b_phoE1x3;   //!
	TBranch        *b_phoE2x2;   //!
	TBranch        *b_phoE2x5Max;   //!
	TBranch        *b_phoE5x5;   //!
	TBranch        *b_phoESEffSigmaRR;   //!
	TBranch        *b_phomaxXtalenergyFull5x5;   //!
	TBranch        *b_phoseedTimeFull5x5;   //!
	TBranch        *b_phomaxXtalenergy;   //!
	TBranch        *b_phoseedTime;   //!
	TBranch        *b_phoSigmaIEtaIEtaFull5x5;   //!
	TBranch        *b_phoSigmaIEtaIPhiFull5x5;   //!
	TBranch        *b_phoSigmaIPhiIPhiFull5x5;   //!
	TBranch        *b_phoE1x3Full5x5;   //!
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
	TBranch        *b_phoPFChIsoFrix1;   //!
	TBranch        *b_phoPFChIsoFrix2;   //!
	TBranch        *b_phoPFChIsoFrix3;   //!
	TBranch        *b_phoPFChIsoFrix4;   //!
	TBranch        *b_phoPFChIsoFrix5;   //!
	TBranch        *b_phoPFChIsoFrix6;   //!
	TBranch        *b_phoPFChIsoFrix7;   //!
	TBranch        *b_phoPFChIsoFrix8;   //!
	TBranch        *b_phoPFPhoIsoFrix1;   //!
	TBranch        *b_phoPFPhoIsoFrix2;   //!
	TBranch        *b_phoPFPhoIsoFrix3;   //!
	TBranch        *b_phoPFPhoIsoFrix4;   //!
	TBranch        *b_phoPFPhoIsoFrix5;   //!
	TBranch        *b_phoPFPhoIsoFrix6;   //!
	TBranch        *b_phoPFPhoIsoFrix7;   //!
	TBranch        *b_phoPFPhoIsoFrix8;   //!
	TBranch        *b_phoPFNeuIsoFrix1;   //!
	TBranch        *b_phoPFNeuIsoFrix2;   //!
	TBranch        *b_phoPFNeuIsoFrix3;   //!
	TBranch        *b_phoPFNeuIsoFrix4;   //!
	TBranch        *b_phoPFNeuIsoFrix5;   //!
	TBranch        *b_phoPFNeuIsoFrix6;   //!
	TBranch        *b_phoPFNeuIsoFrix7;   //!
	TBranch        *b_phoPFNeuIsoFrix8;   //!
	TBranch        *b_phoEcalRecHitSumEtConeDR03;   //!
	TBranch        *b_phohcalDepth1TowerSumEtConeDR03;   //!
	TBranch        *b_phohcalDepth2TowerSumEtConeDR03;   //!
	TBranch        *b_phohcalTowerSumEtConeDR03;   //!
	TBranch        *b_photrkSumPtHollowConeDR03;   //!
	TBranch        *b_phoIDMVA;   //!
	TBranch        *b_phoFiredSingleTrgs;   //!
	TBranch        *b_phoFiredDoubleTrgs;   //!
	TBranch        *b_phoIDbit;   //!
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
	TBranch        *b_elePt;   //!
	TBranch        *b_eleEta;   //!
	TBranch        *b_elePhi;   //!
	TBranch        *b_eleR9;   //!
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
	TBranch        *b_eleSigmaIEtaIEta;   //!
	TBranch        *b_eleSigmaIEtaIPhi;   //!
	TBranch        *b_eleSigmaIPhiIPhi;   //!
	TBranch        *b_eleSigmaIEtaIEtaFull5x5;   //!
	TBranch        *b_eleSigmaIPhiIPhiFull5x5;   //!
	TBranch        *b_eleConvVeto;   //!
	TBranch        *b_eleMissHits;   //!
	TBranch        *b_eleESEffSigmaRR;   //!
	TBranch        *b_elePFChIso;   //!
	TBranch        *b_elePFPhoIso;   //!
	TBranch        *b_elePFNeuIso;   //!
	TBranch        *b_elePFPUIso;   //!
	TBranch        *b_eleIDMVANonTrg;   //!
	TBranch        *b_eleIDMVATrg;   //!
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
	TBranch        *b_eleFiredTrgs;   //!
	TBranch        *b_eleIDbit;   //!
	TBranch        *b_eleESEnP1Raw;   //!
	TBranch        *b_eleESEnP2Raw;   //!
	TBranch        *b_nGSFTrk;   //!
	TBranch        *b_gsfPt;   //!
	TBranch        *b_gsfEta;   //!
	TBranch        *b_gsfPhi;   //!
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
	TBranch        *b_muIsLooseID;   //!
	TBranch        *b_muIsMediumID;   //!
	TBranch        *b_muIsTightID;   //!
	TBranch        *b_muIsSoftID;   //!
	TBranch        *b_muIsHighPtID;   //!
	TBranch        *b_muD0;   //!
	TBranch        *b_muDz;   //!
	TBranch        *b_muChi2NDF;   //!
	TBranch        *b_muInnerD0;   //!
	TBranch        *b_muInnerDz;   //!
	TBranch        *b_muTrkLayers;   //!
	TBranch        *b_muPixelLayers;   //!
	TBranch        *b_muPixelHits;   //!
	TBranch        *b_muMuonHits;   //!
	TBranch        *b_muStations;   //!
	TBranch        *b_muTrkQuality;   //!
	TBranch        *b_muIsoTrk;   //!
	TBranch        *b_muPFChIso;   //!
	TBranch        *b_muPFPhoIso;   //!
	TBranch        *b_muPFNeuIso;   //!
	TBranch        *b_muPFPUIso;   //!
	TBranch        *b_muFiredTrgs;   //!
	TBranch        *b_muInnervalidFraction;   //!
	TBranch        *b_musegmentCompatibility;   //!
	TBranch        *b_muchi2LocalPosition;   //!
	TBranch        *b_mutrkKink;   //!
	TBranch        *b_muBestTrkPtError;   //!
	TBranch        *b_muBestTrkPt;   //!
	TBranch        *b_nTau;   //!
	TBranch        *b_pfTausDiscriminationByDecayModeFinding;   //!
	TBranch        *b_pfTausDiscriminationByDecayModeFindingNewDMs;   //!
	TBranch        *b_tauByMVA5LooseElectronRejection;   //!
	TBranch        *b_tauByMVA5MediumElectronRejection;   //!
	TBranch        *b_tauByMVA5TightElectronRejection;   //!
	TBranch        *b_tauByMVA5VTightElectronRejection;   //!
	TBranch        *b_tauByLooseMuonRejection3;   //!
	TBranch        *b_tauByTightMuonRejection3;   //!
	TBranch        *b_tauByLooseCombinedIsolationDeltaBetaCorr3Hits;   //!
	TBranch        *b_tauByMediumCombinedIsolationDeltaBetaCorr3Hits;   //!
	TBranch        *b_tauByTightCombinedIsolationDeltaBetaCorr3Hits;   //!
	TBranch        *b_tauCombinedIsolationDeltaBetaCorrRaw3Hits;   //!
	TBranch        *b_tauByVLooseIsolationMVA3oldDMwLT;   //!
	TBranch        *b_tauByLooseIsolationMVA3oldDMwLT;   //!
	TBranch        *b_tauByMediumIsolationMVA3oldDMwLT;   //!
	TBranch        *b_tauByTightIsolationMVA3oldDMwLT;   //!
	TBranch        *b_tauByVTightIsolationMVA3oldDMwLT;   //!
	TBranch        *b_tauByVVTightIsolationMVA3oldDMwLT;   //!
	TBranch        *b_tauByIsolationMVA3oldDMwLTraw;   //!
	TBranch        *b_tauByLooseIsolationMVA3newDMwLT;   //!
	TBranch        *b_tauByVLooseIsolationMVA3newDMwLT;   //!
	TBranch        *b_tauByMediumIsolationMVA3newDMwLT;   //!
	TBranch        *b_tauByTightIsolationMVA3newDMwLT;   //!
	TBranch        *b_tauByVTightIsolationMVA3newDMwLT;   //!
	TBranch        *b_tauByVVTightIsolationMVA3newDMwLT;   //!
	TBranch        *b_tauByIsolationMVA3newDMwLTraw;   //!
	TBranch        *b_tauEta;   //!
	TBranch        *b_tauPhi;   //!
	TBranch        *b_tauPt;   //!
	TBranch        *b_tauEt;   //!
	TBranch        *b_tauCharge;   //!
	TBranch        *b_tauP;   //!
	TBranch        *b_tauPx;   //!
	TBranch        *b_tauPy;   //!
	TBranch        *b_tauPz;   //!
	TBranch        *b_tauVz;   //!
	TBranch        *b_tauEnergy;   //!
	TBranch        *b_tauMass;   //!
	TBranch        *b_tauDxy;   //!
	TBranch        *b_tauZImpact;   //!
	TBranch        *b_tauDecayMode;   //!
	TBranch        *b_tauLeadChargedHadronExists;   //!
	TBranch        *b_tauLeadChargedHadronEta;   //!
	TBranch        *b_tauLeadChargedHadronPhi;   //!
	TBranch        *b_tauLeadChargedHadronPt;   //!
	TBranch        *b_tauChargedIsoPtSum;   //!
	TBranch        *b_tauNeutralIsoPtSum;   //!
	TBranch        *b_tauPuCorrPtSum;   //!
	TBranch        *b_tauNumSignalPFChargedHadrCands;   //!
	TBranch        *b_tauNumSignalPFNeutrHadrCands;   //!
	TBranch        *b_tauNumSignalPFGammaCands;   //!
	TBranch        *b_tauNumSignalPFCands;   //!
	TBranch        *b_tauNumIsolationPFChargedHadrCands;   //!
	TBranch        *b_tauNumIsolationPFNeutrHadrCands;   //!
	TBranch        *b_tauNumIsolationPFGammaCands;   //!
	TBranch        *b_tauNumIsolationPFCands;   //!
	TBranch        *b_nJet;   //!
	TBranch        *b_jetPt;   //!
	TBranch        *b_jetEn;   //!
	TBranch        *b_jetEta;   //!
	TBranch        *b_jetPhi;   //!
	TBranch        *b_jetRawPt;   //!
	TBranch        *b_jetRawEn;   //!
	TBranch        *b_jetArea;   //!
	TBranch        *b_jetpfCombinedInclusiveSecondaryVertexV2BJetTags;   //!
	TBranch        *b_jetJetProbabilityBJetTags;   //!
	TBranch        *b_jetpfCombinedMVABJetTags;   //!
	TBranch        *b_jetPartonID;   //!
	TBranch        *b_jetGenJetIndex;   //!
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
	TBranch        *b_jetPFLooseId;   //!
	TBranch        *b_jetPUidFullDiscriminant;   //!
	TBranch        *b_jetJECUnc;   //!
	TBranch        *b_jetFiredTrgs;   //!
	TBranch        *b_jetCHF;   //!
	TBranch        *b_jetNHF;   //!
	TBranch        *b_jetCEF;   //!
	TBranch        *b_jetNEF;   //!
	TBranch        *b_jetNCH;   //!
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
	TBranch        *b_AK8Jetnconstituents;   //!
	TBranch        *b_AK8JetPFLooseId;   //!
	TBranch        *b_AK8CHSSoftDropJetMass;   //!
	TBranch        *b_AK8JetpfBoostedDSVBTag;   //!
	TBranch        *b_AK8JetJECUnc;   //!
	TBranch        *b_AK8JetPartonID;   //!
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
	TBranch        *b_nAK8softdropSubjet;   //!
	TBranch        *b_AK8softdropSubjetPt;   //!
	TBranch        *b_AK8softdropSubjetEta;   //!
	TBranch        *b_AK8softdropSubjetPhi;   //!
	TBranch        *b_AK8softdropSubjetMass;   //!
	TBranch        *b_AK8softdropSubjetE;   //!
	TBranch        *b_AK8softdropSubjetCharge;   //!
	TBranch        *b_AK8softdropSubjetFlavour;   //!
	TBranch        *b_AK8softdropSubjetCSV;   //!

	//PhoJet_Analyzer_MC(TTree *tree=0);
	PhoJet_Analyzer_MC();
	virtual ~PhoJet_Analyzer_MC();
	virtual Int_t    Cut(Long64_t entry);
	virtual Int_t    GetEntry(Long64_t entry);
	virtual Long64_t LoadTree(Long64_t entry);
	virtual void     Init(TTree *tree);
	virtual void     Loop();
	virtual Bool_t   Notify();
	virtual void     Show(Long64_t entry = -1);
	// User Defined functions :
	void     BookHistos();
	void     WriteHistos();
	Bool_t   PrimaryVertex(Int_t &goodVertex);
	Double_t getDR(Double_t eta1, Double_t eta2, Double_t phi1, Double_t phi2);
	Double_t getDEta(Double_t eta1, Double_t eta2);
	Double_t getDPhi(Double_t phi1, Double_t phi2);
	Double_t getMass(Int_t p, Int_t j);
	Int_t    getPhotonCand(TString phoWP);
	Bool_t   CutBasedPFPhotonID(Int_t ipho, TString phoWP);
	Double_t EAcharged(Double_t eta);
	Double_t EAneutral(Double_t eta);
	Double_t EAphoton(Double_t eta);
	Bool_t   jetID(Int_t ijet);
	Bool_t   AK8jetID(Int_t ijet);

};

#endif

#ifdef PhoJet_Analyzer_MC_cxx
PhoJet_Analyzer_MC::PhoJet_Analyzer_MC()
    //PhoJet_Analyzer_MC::PhoJet_Analyzer_MC(TTree *tree) : fChain(0) 
{

    TChain *chain = new TChain("ggNtuplizer/EventTree");

    //add input files here
    ifstream datafile;
    datafile.open("${datafile}", ifstream::in);
    char datafilename[500];

    for(Int_t ii = 1; ii <= ${ef} && ii <= ${Tot}; ++ii){
	datafile >> datafilename;
	string fname(datafilename);
	string main_path       = "${sourceDir}";

	if(ii >= ${sf} && ii <= ${Tot}){
	    chain->Add((main_path+fname).c_str());
	    cout<<((main_path+fname).c_str())<<endl;
	    cout<<chain->GetEntries()<<endl;
	}
    }

    //    chain->Add("/eos/uscms/store/user/lpcqstar/13TeV/NTuples/MC/Signal_Qstar/QstarToGJ_M1000_f1p0/AOD_QstarToGJ_M1000_f1p0_1.root");
    Init(chain);

}

PhoJet_Analyzer_MC::~PhoJet_Analyzer_MC()
{
    if (!fChain) return;
    delete fChain->GetCurrentFile();

    f1->cd();
    f1->Write();

    f1->Close();
}

Int_t PhoJet_Analyzer_MC::GetEntry(Long64_t entry)
{
    // Read contents of entry.
    if (!fChain) return 0;
    return fChain->GetEntry(entry);
}
Long64_t PhoJet_Analyzer_MC::LoadTree(Long64_t entry)
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

void PhoJet_Analyzer_MC::Init(TTree *tree)
{
    // The Init() function is called when the selector needs to initialize
    // a new tree or chain. Typically here the branch addresses and branch
    // pointers of the tree will be set.
    // It is normally not necessary to make changes to the generated
    // code, but the routine can be extended by the user if needed.
    // Init() will be called many times when running on PROOF
    // (once per file to be processed).

    // Set object pointer
    nTrksPV = 0;
    vtx = 0;
    vty = 0;
    vtz = 0;
    vrho = 0;
    vndof = 0;
    vchi2 = 0;
    isFake = 0;
    pdf = 0;
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
    phoSigmaIEtaIEta = 0;
    phoSigmaIEtaIPhi = 0;
    phoSigmaIPhiIPhi = 0;
    phoE1x3 = 0;
    phoE2x2 = 0;
    phoE2x5Max = 0;
    phoE5x5 = 0;
    phoESEffSigmaRR = 0;
    phomaxXtalenergyFull5x5 = 0;
    phoseedTimeFull5x5 = 0;
    phomaxXtalenergy = 0;
    phoseedTime = 0;
    phoSigmaIEtaIEtaFull5x5 = 0;
    phoSigmaIEtaIPhiFull5x5 = 0;
    phoSigmaIPhiIPhiFull5x5 = 0;
    phoE1x3Full5x5 = 0;
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
    phoPFChIsoFrix1 = 0;
    phoPFChIsoFrix2 = 0;
    phoPFChIsoFrix3 = 0;
    phoPFChIsoFrix4 = 0;
    phoPFChIsoFrix5 = 0;
    phoPFChIsoFrix6 = 0;
    phoPFChIsoFrix7 = 0;
    phoPFChIsoFrix8 = 0;
    phoPFPhoIsoFrix1 = 0;
    phoPFPhoIsoFrix2 = 0;
    phoPFPhoIsoFrix3 = 0;
    phoPFPhoIsoFrix4 = 0;
    phoPFPhoIsoFrix5 = 0;
    phoPFPhoIsoFrix6 = 0;
    phoPFPhoIsoFrix7 = 0;
    phoPFPhoIsoFrix8 = 0;
    phoPFNeuIsoFrix1 = 0;
    phoPFNeuIsoFrix2 = 0;
    phoPFNeuIsoFrix3 = 0;
    phoPFNeuIsoFrix4 = 0;
    phoPFNeuIsoFrix5 = 0;
    phoPFNeuIsoFrix6 = 0;
    phoPFNeuIsoFrix7 = 0;
    phoPFNeuIsoFrix8 = 0;
    phoEcalRecHitSumEtConeDR03 = 0;
    phohcalDepth1TowerSumEtConeDR03 = 0;
    phohcalDepth2TowerSumEtConeDR03 = 0;
    phohcalTowerSumEtConeDR03 = 0;
    photrkSumPtHollowConeDR03 = 0;
    phoIDMVA = 0;
    phoFiredSingleTrgs = 0;
    phoFiredDoubleTrgs = 0;
    phoIDbit = 0;
    eleCharge = 0;
    eleChargeConsistent = 0;
    eleEn = 0;
    eleSCEn = 0;
    eleESEn = 0;
    eleESEnP1 = 0;
    eleESEnP2 = 0;
    eleD0 = 0;
    eleDz = 0;
    elePt = 0;
    eleEta = 0;
    elePhi = 0;
    eleR9 = 0;
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
    eleSigmaIEtaIEta = 0;
    eleSigmaIEtaIPhi = 0;
    eleSigmaIPhiIPhi = 0;
    eleSigmaIEtaIEtaFull5x5 = 0;
    eleSigmaIPhiIPhiFull5x5 = 0;
    eleConvVeto = 0;
    eleMissHits = 0;
    eleESEffSigmaRR = 0;
    elePFChIso = 0;
    elePFPhoIso = 0;
    elePFNeuIso = 0;
    elePFPUIso = 0;
    eleIDMVANonTrg = 0;
    eleIDMVATrg = 0;
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
    eleFiredTrgs = 0;
    eleIDbit = 0;
    eleESEnP1Raw = 0;
    eleESEnP2Raw = 0;
    gsfPt = 0;
    gsfEta = 0;
    gsfPhi = 0;
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
    muIsLooseID = 0;
    muIsMediumID = 0;
    muIsTightID = 0;
    muIsSoftID = 0;
    muIsHighPtID = 0;
    muD0 = 0;
    muDz = 0;
    muChi2NDF = 0;
    muInnerD0 = 0;
    muInnerDz = 0;
    muTrkLayers = 0;
    muPixelLayers = 0;
    muPixelHits = 0;
    muMuonHits = 0;
    muStations = 0;
    muTrkQuality = 0;
    muIsoTrk = 0;
    muPFChIso = 0;
    muPFPhoIso = 0;
    muPFNeuIso = 0;
    muPFPUIso = 0;
    muFiredTrgs = 0;
    muInnervalidFraction = 0;
    musegmentCompatibility = 0;
    muchi2LocalPosition = 0;
    mutrkKink = 0;
    muBestTrkPtError = 0;
    muBestTrkPt = 0;
    pfTausDiscriminationByDecayModeFinding = 0;
    pfTausDiscriminationByDecayModeFindingNewDMs = 0;
    tauByMVA5LooseElectronRejection = 0;
    tauByMVA5MediumElectronRejection = 0;
    tauByMVA5TightElectronRejection = 0;
    tauByMVA5VTightElectronRejection = 0;
    tauByLooseMuonRejection3 = 0;
    tauByTightMuonRejection3 = 0;
    tauByLooseCombinedIsolationDeltaBetaCorr3Hits = 0;
    tauByMediumCombinedIsolationDeltaBetaCorr3Hits = 0;
    tauByTightCombinedIsolationDeltaBetaCorr3Hits = 0;
    tauCombinedIsolationDeltaBetaCorrRaw3Hits = 0;
    tauByVLooseIsolationMVA3oldDMwLT = 0;
    tauByLooseIsolationMVA3oldDMwLT = 0;
    tauByMediumIsolationMVA3oldDMwLT = 0;
    tauByTightIsolationMVA3oldDMwLT = 0;
    tauByVTightIsolationMVA3oldDMwLT = 0;
    tauByVVTightIsolationMVA3oldDMwLT = 0;
    tauByIsolationMVA3oldDMwLTraw = 0;
    tauByLooseIsolationMVA3newDMwLT = 0;
    tauByVLooseIsolationMVA3newDMwLT = 0;
    tauByMediumIsolationMVA3newDMwLT = 0;
    tauByTightIsolationMVA3newDMwLT = 0;
    tauByVTightIsolationMVA3newDMwLT = 0;
    tauByVVTightIsolationMVA3newDMwLT = 0;
    tauByIsolationMVA3newDMwLTraw = 0;
    tauEta = 0;
    tauPhi = 0;
    tauPt = 0;
    tauEt = 0;
    tauCharge = 0;
    tauP = 0;
    tauPx = 0;
    tauPy = 0;
    tauPz = 0;
    tauVz = 0;
    tauEnergy = 0;
    tauMass = 0;
    tauDxy = 0;
    tauZImpact = 0;
    tauDecayMode = 0;
    tauLeadChargedHadronExists = 0;
    tauLeadChargedHadronEta = 0;
    tauLeadChargedHadronPhi = 0;
    tauLeadChargedHadronPt = 0;
    tauChargedIsoPtSum = 0;
    tauNeutralIsoPtSum = 0;
    tauPuCorrPtSum = 0;
    tauNumSignalPFChargedHadrCands = 0;
    tauNumSignalPFNeutrHadrCands = 0;
    tauNumSignalPFGammaCands = 0;
    tauNumSignalPFCands = 0;
    tauNumIsolationPFChargedHadrCands = 0;
    tauNumIsolationPFNeutrHadrCands = 0;
    tauNumIsolationPFGammaCands = 0;
    tauNumIsolationPFCands = 0;
    jetPt = 0;
    jetEn = 0;
    jetEta = 0;
    jetPhi = 0;
    jetRawPt = 0;
    jetRawEn = 0;
    jetArea = 0;
    jetpfCombinedInclusiveSecondaryVertexV2BJetTags = 0;
    jetJetProbabilityBJetTags = 0;
    jetpfCombinedMVABJetTags = 0;
    jetPartonID = 0;
    jetGenJetIndex = 0;
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
    jetPFLooseId = 0;
    jetPUidFullDiscriminant = 0;
    jetJECUnc = 0;
    jetFiredTrgs = 0;
    jetCHF = 0;
    jetNHF = 0;
    jetCEF = 0;
    jetNEF = 0;
    jetNCH = 0;
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
    AK8Jetnconstituents = 0;
    AK8JetPFLooseId = 0;
    AK8CHSSoftDropJetMass = 0;
    AK8JetpfBoostedDSVBTag = 0;
    AK8JetJECUnc = 0;
    AK8JetPartonID = 0;
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
    nAK8softdropSubjet = 0;
    AK8softdropSubjetPt = 0;
    AK8softdropSubjetEta = 0;
    AK8softdropSubjetPhi = 0;
    AK8softdropSubjetMass = 0;
    AK8softdropSubjetE = 0;
    AK8softdropSubjetCharge = 0;
    AK8softdropSubjetFlavour = 0;
    AK8softdropSubjetCSV = 0;
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
    fChain->SetBranchAddress("nTrksPV", &nTrksPV, &b_nTrksPV);
    fChain->SetBranchAddress("vtx", &vtx, &b_vtx);
    fChain->SetBranchAddress("vty", &vty, &b_vty);
    fChain->SetBranchAddress("vtz", &vtz, &b_vtz);
    fChain->SetBranchAddress("vrho", &vrho, &b_vrho);
    fChain->SetBranchAddress("vndof", &vndof, &b_vndof);
    fChain->SetBranchAddress("vchi2", &vchi2, &b_vchi2);
    fChain->SetBranchAddress("isFake", &isFake, &b_isFake);
    fChain->SetBranchAddress("rho", &rho, &b_rho);
    fChain->SetBranchAddress("rhoCentral", &rhoCentral, &b_rhoCentral);
    fChain->SetBranchAddress("HLTEleMuX", &HLTEleMuX, &b_HLTEleMuX);
    fChain->SetBranchAddress("HLTPho", &HLTPho, &b_HLTPho);
    fChain->SetBranchAddress("HLTJet", &HLTJet, &b_HLTJet);
    fChain->SetBranchAddress("HLTEleMuXIsPrescaled", &HLTEleMuXIsPrescaled, &b_HLTEleMuXIsPrescaled);
    fChain->SetBranchAddress("HLTPhoIsPrescaled", &HLTPhoIsPrescaled, &b_HLTPhoIsPrescaled);
    fChain->SetBranchAddress("HLTJetIsPrescaled", &HLTJetIsPrescaled, &b_HLTJetIsPrescaled);
    fChain->SetBranchAddress("pdf", &pdf, &b_pdf);
    fChain->SetBranchAddress("pthat", &pthat, &b_pthat);
    fChain->SetBranchAddress("processID", &processID, &b_processID);
    fChain->SetBranchAddress("genWeight", &genWeight, &b_genWeight);
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
    fChain->SetBranchAddress("metFilters", &metFilters, &b_metFilters);
    fChain->SetBranchAddress("genMET", &genMET, &b_genMET);
    fChain->SetBranchAddress("genMETPhi", &genMETPhi, &b_genMETPhi);
    fChain->SetBranchAddress("pfMET", &pfMET, &b_pfMET);
    fChain->SetBranchAddress("pfMETPhi", &pfMETPhi, &b_pfMETPhi);
    fChain->SetBranchAddress("pfMETsumEt", &pfMETsumEt, &b_pfMETsumEt);
    fChain->SetBranchAddress("pfMETmEtSig", &pfMETmEtSig, &b_pfMETmEtSig);
    fChain->SetBranchAddress("pfMETSig", &pfMETSig, &b_pfMETSig);
    fChain->SetBranchAddress("pfMET_T1JERUp", &pfMET_T1JERUp, &b_pfMET_T1JERUp);
    fChain->SetBranchAddress("pfMET_T1JERDo", &pfMET_T1JERDo, &b_pfMET_T1JERDo);
    fChain->SetBranchAddress("pfMET_T1JESUp", &pfMET_T1JESUp, &b_pfMET_T1JESUp);
    fChain->SetBranchAddress("pfMET_T1JESDo", &pfMET_T1JESDo, &b_pfMET_T1JESDo);
    fChain->SetBranchAddress("pfMET_T1MESUp", &pfMET_T1MESUp, &b_pfMET_T1MESUp);
    fChain->SetBranchAddress("pfMET_T1MESDo", &pfMET_T1MESDo, &b_pfMET_T1MESDo);
    fChain->SetBranchAddress("pfMET_T1EESUp", &pfMET_T1EESUp, &b_pfMET_T1EESUp);
    fChain->SetBranchAddress("pfMET_T1EESDo", &pfMET_T1EESDo, &b_pfMET_T1EESDo);
    fChain->SetBranchAddress("pfMET_T1PESUp", &pfMET_T1PESUp, &b_pfMET_T1PESUp);
    fChain->SetBranchAddress("pfMET_T1PESDo", &pfMET_T1PESDo, &b_pfMET_T1PESDo);
    fChain->SetBranchAddress("pfMET_T1TESUp", &pfMET_T1TESUp, &b_pfMET_T1TESUp);
    fChain->SetBranchAddress("pfMET_T1TESDo", &pfMET_T1TESDo, &b_pfMET_T1TESDo);
    fChain->SetBranchAddress("pfMET_T1UESUp", &pfMET_T1UESUp, &b_pfMET_T1UESUp);
    fChain->SetBranchAddress("pfMET_T1UESDo", &pfMET_T1UESDo, &b_pfMET_T1UESDo);
    fChain->SetBranchAddress("nPho", &nPho, &b_nPho);
    fChain->SetBranchAddress("phoE", &phoE, &b_phoE);
    fChain->SetBranchAddress("phoEt", &phoEt, &b_phoEt);
    fChain->SetBranchAddress("phoEta", &phoEta, &b_phoEta);
    fChain->SetBranchAddress("phoPhi", &phoPhi, &b_phoPhi);
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
    fChain->SetBranchAddress("phoSigmaIEtaIEta", &phoSigmaIEtaIEta, &b_phoSigmaIEtaIEta);
    fChain->SetBranchAddress("phoSigmaIEtaIPhi", &phoSigmaIEtaIPhi, &b_phoSigmaIEtaIPhi);
    fChain->SetBranchAddress("phoSigmaIPhiIPhi", &phoSigmaIPhiIPhi, &b_phoSigmaIPhiIPhi);
    fChain->SetBranchAddress("phoE1x3", &phoE1x3, &b_phoE1x3);
    fChain->SetBranchAddress("phoE2x2", &phoE2x2, &b_phoE2x2);
    fChain->SetBranchAddress("phoE2x5Max", &phoE2x5Max, &b_phoE2x5Max);
    fChain->SetBranchAddress("phoE5x5", &phoE5x5, &b_phoE5x5);
    fChain->SetBranchAddress("phoESEffSigmaRR", &phoESEffSigmaRR, &b_phoESEffSigmaRR);
    fChain->SetBranchAddress("phomaxXtalenergyFull5x5", &phomaxXtalenergyFull5x5, &b_phomaxXtalenergyFull5x5);
    fChain->SetBranchAddress("phoseedTimeFull5x5", &phoseedTimeFull5x5, &b_phoseedTimeFull5x5);
    fChain->SetBranchAddress("phomaxXtalenergy", &phomaxXtalenergy, &b_phomaxXtalenergy);
    fChain->SetBranchAddress("phoseedTime", &phoseedTime, &b_phoseedTime);
    fChain->SetBranchAddress("phoSigmaIEtaIEtaFull5x5", &phoSigmaIEtaIEtaFull5x5, &b_phoSigmaIEtaIEtaFull5x5);
    fChain->SetBranchAddress("phoSigmaIEtaIPhiFull5x5", &phoSigmaIEtaIPhiFull5x5, &b_phoSigmaIEtaIPhiFull5x5);
    fChain->SetBranchAddress("phoSigmaIPhiIPhiFull5x5", &phoSigmaIPhiIPhiFull5x5, &b_phoSigmaIPhiIPhiFull5x5);
    fChain->SetBranchAddress("phoE1x3Full5x5", &phoE1x3Full5x5, &b_phoE1x3Full5x5);
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
    fChain->SetBranchAddress("phoPFChIsoFrix1", &phoPFChIsoFrix1, &b_phoPFChIsoFrix1);
    fChain->SetBranchAddress("phoPFChIsoFrix2", &phoPFChIsoFrix2, &b_phoPFChIsoFrix2);
    fChain->SetBranchAddress("phoPFChIsoFrix3", &phoPFChIsoFrix3, &b_phoPFChIsoFrix3);
    fChain->SetBranchAddress("phoPFChIsoFrix4", &phoPFChIsoFrix4, &b_phoPFChIsoFrix4);
    fChain->SetBranchAddress("phoPFChIsoFrix5", &phoPFChIsoFrix5, &b_phoPFChIsoFrix5);
    fChain->SetBranchAddress("phoPFChIsoFrix6", &phoPFChIsoFrix6, &b_phoPFChIsoFrix6);
    fChain->SetBranchAddress("phoPFChIsoFrix7", &phoPFChIsoFrix7, &b_phoPFChIsoFrix7);
    fChain->SetBranchAddress("phoPFChIsoFrix8", &phoPFChIsoFrix8, &b_phoPFChIsoFrix8);
    fChain->SetBranchAddress("phoPFPhoIsoFrix1", &phoPFPhoIsoFrix1, &b_phoPFPhoIsoFrix1);
    fChain->SetBranchAddress("phoPFPhoIsoFrix2", &phoPFPhoIsoFrix2, &b_phoPFPhoIsoFrix2);
    fChain->SetBranchAddress("phoPFPhoIsoFrix3", &phoPFPhoIsoFrix3, &b_phoPFPhoIsoFrix3);
    fChain->SetBranchAddress("phoPFPhoIsoFrix4", &phoPFPhoIsoFrix4, &b_phoPFPhoIsoFrix4);
    fChain->SetBranchAddress("phoPFPhoIsoFrix5", &phoPFPhoIsoFrix5, &b_phoPFPhoIsoFrix5);
    fChain->SetBranchAddress("phoPFPhoIsoFrix6", &phoPFPhoIsoFrix6, &b_phoPFPhoIsoFrix6);
    fChain->SetBranchAddress("phoPFPhoIsoFrix7", &phoPFPhoIsoFrix7, &b_phoPFPhoIsoFrix7);
    fChain->SetBranchAddress("phoPFPhoIsoFrix8", &phoPFPhoIsoFrix8, &b_phoPFPhoIsoFrix8);
    fChain->SetBranchAddress("phoPFNeuIsoFrix1", &phoPFNeuIsoFrix1, &b_phoPFNeuIsoFrix1);
    fChain->SetBranchAddress("phoPFNeuIsoFrix2", &phoPFNeuIsoFrix2, &b_phoPFNeuIsoFrix2);
    fChain->SetBranchAddress("phoPFNeuIsoFrix3", &phoPFNeuIsoFrix3, &b_phoPFNeuIsoFrix3);
    fChain->SetBranchAddress("phoPFNeuIsoFrix4", &phoPFNeuIsoFrix4, &b_phoPFNeuIsoFrix4);
    fChain->SetBranchAddress("phoPFNeuIsoFrix5", &phoPFNeuIsoFrix5, &b_phoPFNeuIsoFrix5);
    fChain->SetBranchAddress("phoPFNeuIsoFrix6", &phoPFNeuIsoFrix6, &b_phoPFNeuIsoFrix6);
    fChain->SetBranchAddress("phoPFNeuIsoFrix7", &phoPFNeuIsoFrix7, &b_phoPFNeuIsoFrix7);
    fChain->SetBranchAddress("phoPFNeuIsoFrix8", &phoPFNeuIsoFrix8, &b_phoPFNeuIsoFrix8);
    fChain->SetBranchAddress("phoEcalRecHitSumEtConeDR03", &phoEcalRecHitSumEtConeDR03, &b_phoEcalRecHitSumEtConeDR03);
    fChain->SetBranchAddress("phohcalDepth1TowerSumEtConeDR03", &phohcalDepth1TowerSumEtConeDR03, &b_phohcalDepth1TowerSumEtConeDR03);
    fChain->SetBranchAddress("phohcalDepth2TowerSumEtConeDR03", &phohcalDepth2TowerSumEtConeDR03, &b_phohcalDepth2TowerSumEtConeDR03);
    fChain->SetBranchAddress("phohcalTowerSumEtConeDR03", &phohcalTowerSumEtConeDR03, &b_phohcalTowerSumEtConeDR03);
    fChain->SetBranchAddress("photrkSumPtHollowConeDR03", &photrkSumPtHollowConeDR03, &b_photrkSumPtHollowConeDR03);
    fChain->SetBranchAddress("phoIDMVA", &phoIDMVA, &b_phoIDMVA);
    fChain->SetBranchAddress("phoFiredSingleTrgs", &phoFiredSingleTrgs, &b_phoFiredSingleTrgs);
    fChain->SetBranchAddress("phoFiredDoubleTrgs", &phoFiredDoubleTrgs, &b_phoFiredDoubleTrgs);
    fChain->SetBranchAddress("phoIDbit", &phoIDbit, &b_phoIDbit);
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
    fChain->SetBranchAddress("elePt", &elePt, &b_elePt);
    fChain->SetBranchAddress("eleEta", &eleEta, &b_eleEta);
    fChain->SetBranchAddress("elePhi", &elePhi, &b_elePhi);
    fChain->SetBranchAddress("eleR9", &eleR9, &b_eleR9);
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
    fChain->SetBranchAddress("eleSigmaIEtaIEta", &eleSigmaIEtaIEta, &b_eleSigmaIEtaIEta);
    fChain->SetBranchAddress("eleSigmaIEtaIPhi", &eleSigmaIEtaIPhi, &b_eleSigmaIEtaIPhi);
    fChain->SetBranchAddress("eleSigmaIPhiIPhi", &eleSigmaIPhiIPhi, &b_eleSigmaIPhiIPhi);
    fChain->SetBranchAddress("eleSigmaIEtaIEtaFull5x5", &eleSigmaIEtaIEtaFull5x5, &b_eleSigmaIEtaIEtaFull5x5);
    fChain->SetBranchAddress("eleSigmaIPhiIPhiFull5x5", &eleSigmaIPhiIPhiFull5x5, &b_eleSigmaIPhiIPhiFull5x5);
    fChain->SetBranchAddress("eleConvVeto", &eleConvVeto, &b_eleConvVeto);
    fChain->SetBranchAddress("eleMissHits", &eleMissHits, &b_eleMissHits);
    fChain->SetBranchAddress("eleESEffSigmaRR", &eleESEffSigmaRR, &b_eleESEffSigmaRR);
    fChain->SetBranchAddress("elePFChIso", &elePFChIso, &b_elePFChIso);
    fChain->SetBranchAddress("elePFPhoIso", &elePFPhoIso, &b_elePFPhoIso);
    fChain->SetBranchAddress("elePFNeuIso", &elePFNeuIso, &b_elePFNeuIso);
    fChain->SetBranchAddress("elePFPUIso", &elePFPUIso, &b_elePFPUIso);
    fChain->SetBranchAddress("eleIDMVANonTrg", &eleIDMVANonTrg, &b_eleIDMVANonTrg);
    fChain->SetBranchAddress("eleIDMVATrg", &eleIDMVATrg, &b_eleIDMVATrg);
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
    fChain->SetBranchAddress("eleFiredTrgs", &eleFiredTrgs, &b_eleFiredTrgs);
    fChain->SetBranchAddress("eleIDbit", &eleIDbit, &b_eleIDbit);
    fChain->SetBranchAddress("eleESEnP1Raw", &eleESEnP1Raw, &b_eleESEnP1Raw);
    fChain->SetBranchAddress("eleESEnP2Raw", &eleESEnP2Raw, &b_eleESEnP2Raw);
    fChain->SetBranchAddress("nGSFTrk", &nGSFTrk, &b_nGSFTrk);
    fChain->SetBranchAddress("gsfPt", &gsfPt, &b_gsfPt);
    fChain->SetBranchAddress("gsfEta", &gsfEta, &b_gsfEta);
    fChain->SetBranchAddress("gsfPhi", &gsfPhi, &b_gsfPhi);
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
    fChain->SetBranchAddress("muIsLooseID", &muIsLooseID, &b_muIsLooseID);
    fChain->SetBranchAddress("muIsMediumID", &muIsMediumID, &b_muIsMediumID);
    fChain->SetBranchAddress("muIsTightID", &muIsTightID, &b_muIsTightID);
    fChain->SetBranchAddress("muIsSoftID", &muIsSoftID, &b_muIsSoftID);
    fChain->SetBranchAddress("muIsHighPtID", &muIsHighPtID, &b_muIsHighPtID);
    fChain->SetBranchAddress("muD0", &muD0, &b_muD0);
    fChain->SetBranchAddress("muDz", &muDz, &b_muDz);
    fChain->SetBranchAddress("muChi2NDF", &muChi2NDF, &b_muChi2NDF);
    fChain->SetBranchAddress("muInnerD0", &muInnerD0, &b_muInnerD0);
    fChain->SetBranchAddress("muInnerDz", &muInnerDz, &b_muInnerDz);
    fChain->SetBranchAddress("muTrkLayers", &muTrkLayers, &b_muTrkLayers);
    fChain->SetBranchAddress("muPixelLayers", &muPixelLayers, &b_muPixelLayers);
    fChain->SetBranchAddress("muPixelHits", &muPixelHits, &b_muPixelHits);
    fChain->SetBranchAddress("muMuonHits", &muMuonHits, &b_muMuonHits);
    fChain->SetBranchAddress("muStations", &muStations, &b_muStations);
    fChain->SetBranchAddress("muTrkQuality", &muTrkQuality, &b_muTrkQuality);
    fChain->SetBranchAddress("muIsoTrk", &muIsoTrk, &b_muIsoTrk);
    fChain->SetBranchAddress("muPFChIso", &muPFChIso, &b_muPFChIso);
    fChain->SetBranchAddress("muPFPhoIso", &muPFPhoIso, &b_muPFPhoIso);
    fChain->SetBranchAddress("muPFNeuIso", &muPFNeuIso, &b_muPFNeuIso);
    fChain->SetBranchAddress("muPFPUIso", &muPFPUIso, &b_muPFPUIso);
    fChain->SetBranchAddress("muFiredTrgs", &muFiredTrgs, &b_muFiredTrgs);
    fChain->SetBranchAddress("muInnervalidFraction", &muInnervalidFraction, &b_muInnervalidFraction);
    fChain->SetBranchAddress("musegmentCompatibility", &musegmentCompatibility, &b_musegmentCompatibility);
    fChain->SetBranchAddress("muchi2LocalPosition", &muchi2LocalPosition, &b_muchi2LocalPosition);
    fChain->SetBranchAddress("mutrkKink", &mutrkKink, &b_mutrkKink);
    fChain->SetBranchAddress("muBestTrkPtError", &muBestTrkPtError, &b_muBestTrkPtError);
    fChain->SetBranchAddress("muBestTrkPt", &muBestTrkPt, &b_muBestTrkPt);
    fChain->SetBranchAddress("nTau", &nTau, &b_nTau);
    fChain->SetBranchAddress("pfTausDiscriminationByDecayModeFinding", &pfTausDiscriminationByDecayModeFinding, &b_pfTausDiscriminationByDecayModeFinding);
    fChain->SetBranchAddress("pfTausDiscriminationByDecayModeFindingNewDMs", &pfTausDiscriminationByDecayModeFindingNewDMs, &b_pfTausDiscriminationByDecayModeFindingNewDMs);
    fChain->SetBranchAddress("tauByMVA5LooseElectronRejection", &tauByMVA5LooseElectronRejection, &b_tauByMVA5LooseElectronRejection);
    fChain->SetBranchAddress("tauByMVA5MediumElectronRejection", &tauByMVA5MediumElectronRejection, &b_tauByMVA5MediumElectronRejection);
    fChain->SetBranchAddress("tauByMVA5TightElectronRejection", &tauByMVA5TightElectronRejection, &b_tauByMVA5TightElectronRejection);
    fChain->SetBranchAddress("tauByMVA5VTightElectronRejection", &tauByMVA5VTightElectronRejection, &b_tauByMVA5VTightElectronRejection);
    fChain->SetBranchAddress("tauByLooseMuonRejection3", &tauByLooseMuonRejection3, &b_tauByLooseMuonRejection3);
    fChain->SetBranchAddress("tauByTightMuonRejection3", &tauByTightMuonRejection3, &b_tauByTightMuonRejection3);
    fChain->SetBranchAddress("tauByLooseCombinedIsolationDeltaBetaCorr3Hits", &tauByLooseCombinedIsolationDeltaBetaCorr3Hits, &b_tauByLooseCombinedIsolationDeltaBetaCorr3Hits);
    fChain->SetBranchAddress("tauByMediumCombinedIsolationDeltaBetaCorr3Hits", &tauByMediumCombinedIsolationDeltaBetaCorr3Hits, &b_tauByMediumCombinedIsolationDeltaBetaCorr3Hits);
    fChain->SetBranchAddress("tauByTightCombinedIsolationDeltaBetaCorr3Hits", &tauByTightCombinedIsolationDeltaBetaCorr3Hits, &b_tauByTightCombinedIsolationDeltaBetaCorr3Hits);
    fChain->SetBranchAddress("tauCombinedIsolationDeltaBetaCorrRaw3Hits", &tauCombinedIsolationDeltaBetaCorrRaw3Hits, &b_tauCombinedIsolationDeltaBetaCorrRaw3Hits);
    fChain->SetBranchAddress("tauByVLooseIsolationMVA3oldDMwLT", &tauByVLooseIsolationMVA3oldDMwLT, &b_tauByVLooseIsolationMVA3oldDMwLT);
    fChain->SetBranchAddress("tauByLooseIsolationMVA3oldDMwLT", &tauByLooseIsolationMVA3oldDMwLT, &b_tauByLooseIsolationMVA3oldDMwLT);
    fChain->SetBranchAddress("tauByMediumIsolationMVA3oldDMwLT", &tauByMediumIsolationMVA3oldDMwLT, &b_tauByMediumIsolationMVA3oldDMwLT);
    fChain->SetBranchAddress("tauByTightIsolationMVA3oldDMwLT", &tauByTightIsolationMVA3oldDMwLT, &b_tauByTightIsolationMVA3oldDMwLT);
    fChain->SetBranchAddress("tauByVTightIsolationMVA3oldDMwLT", &tauByVTightIsolationMVA3oldDMwLT, &b_tauByVTightIsolationMVA3oldDMwLT);
    fChain->SetBranchAddress("tauByVVTightIsolationMVA3oldDMwLT", &tauByVVTightIsolationMVA3oldDMwLT, &b_tauByVVTightIsolationMVA3oldDMwLT);
    fChain->SetBranchAddress("tauByIsolationMVA3oldDMwLTraw", &tauByIsolationMVA3oldDMwLTraw, &b_tauByIsolationMVA3oldDMwLTraw);
    fChain->SetBranchAddress("tauByLooseIsolationMVA3newDMwLT", &tauByLooseIsolationMVA3newDMwLT, &b_tauByLooseIsolationMVA3newDMwLT);
    fChain->SetBranchAddress("tauByVLooseIsolationMVA3newDMwLT", &tauByVLooseIsolationMVA3newDMwLT, &b_tauByVLooseIsolationMVA3newDMwLT);
    fChain->SetBranchAddress("tauByMediumIsolationMVA3newDMwLT", &tauByMediumIsolationMVA3newDMwLT, &b_tauByMediumIsolationMVA3newDMwLT);
    fChain->SetBranchAddress("tauByTightIsolationMVA3newDMwLT", &tauByTightIsolationMVA3newDMwLT, &b_tauByTightIsolationMVA3newDMwLT);
    fChain->SetBranchAddress("tauByVTightIsolationMVA3newDMwLT", &tauByVTightIsolationMVA3newDMwLT, &b_tauByVTightIsolationMVA3newDMwLT);
    fChain->SetBranchAddress("tauByVVTightIsolationMVA3newDMwLT", &tauByVVTightIsolationMVA3newDMwLT, &b_tauByVVTightIsolationMVA3newDMwLT);
    fChain->SetBranchAddress("tauByIsolationMVA3newDMwLTraw", &tauByIsolationMVA3newDMwLTraw, &b_tauByIsolationMVA3newDMwLTraw);
    fChain->SetBranchAddress("tauEta", &tauEta, &b_tauEta);
    fChain->SetBranchAddress("tauPhi", &tauPhi, &b_tauPhi);
    fChain->SetBranchAddress("tauPt", &tauPt, &b_tauPt);
    fChain->SetBranchAddress("tauEt", &tauEt, &b_tauEt);
    fChain->SetBranchAddress("tauCharge", &tauCharge, &b_tauCharge);
    fChain->SetBranchAddress("tauP", &tauP, &b_tauP);
    fChain->SetBranchAddress("tauPx", &tauPx, &b_tauPx);
    fChain->SetBranchAddress("tauPy", &tauPy, &b_tauPy);
    fChain->SetBranchAddress("tauPz", &tauPz, &b_tauPz);
    fChain->SetBranchAddress("tauVz", &tauVz, &b_tauVz);
    fChain->SetBranchAddress("tauEnergy", &tauEnergy, &b_tauEnergy);
    fChain->SetBranchAddress("tauMass", &tauMass, &b_tauMass);
    fChain->SetBranchAddress("tauDxy", &tauDxy, &b_tauDxy);
    fChain->SetBranchAddress("tauZImpact", &tauZImpact, &b_tauZImpact);
    fChain->SetBranchAddress("tauDecayMode", &tauDecayMode, &b_tauDecayMode);
    fChain->SetBranchAddress("tauLeadChargedHadronExists", &tauLeadChargedHadronExists, &b_tauLeadChargedHadronExists);
    fChain->SetBranchAddress("tauLeadChargedHadronEta", &tauLeadChargedHadronEta, &b_tauLeadChargedHadronEta);
    fChain->SetBranchAddress("tauLeadChargedHadronPhi", &tauLeadChargedHadronPhi, &b_tauLeadChargedHadronPhi);
    fChain->SetBranchAddress("tauLeadChargedHadronPt", &tauLeadChargedHadronPt, &b_tauLeadChargedHadronPt);
    fChain->SetBranchAddress("tauChargedIsoPtSum", &tauChargedIsoPtSum, &b_tauChargedIsoPtSum);
    fChain->SetBranchAddress("tauNeutralIsoPtSum", &tauNeutralIsoPtSum, &b_tauNeutralIsoPtSum);
    fChain->SetBranchAddress("tauPuCorrPtSum", &tauPuCorrPtSum, &b_tauPuCorrPtSum);
    fChain->SetBranchAddress("tauNumSignalPFChargedHadrCands", &tauNumSignalPFChargedHadrCands, &b_tauNumSignalPFChargedHadrCands);
    fChain->SetBranchAddress("tauNumSignalPFNeutrHadrCands", &tauNumSignalPFNeutrHadrCands, &b_tauNumSignalPFNeutrHadrCands);
    fChain->SetBranchAddress("tauNumSignalPFGammaCands", &tauNumSignalPFGammaCands, &b_tauNumSignalPFGammaCands);
    fChain->SetBranchAddress("tauNumSignalPFCands", &tauNumSignalPFCands, &b_tauNumSignalPFCands);
    fChain->SetBranchAddress("tauNumIsolationPFChargedHadrCands", &tauNumIsolationPFChargedHadrCands, &b_tauNumIsolationPFChargedHadrCands);
    fChain->SetBranchAddress("tauNumIsolationPFNeutrHadrCands", &tauNumIsolationPFNeutrHadrCands, &b_tauNumIsolationPFNeutrHadrCands);
    fChain->SetBranchAddress("tauNumIsolationPFGammaCands", &tauNumIsolationPFGammaCands, &b_tauNumIsolationPFGammaCands);
    fChain->SetBranchAddress("tauNumIsolationPFCands", &tauNumIsolationPFCands, &b_tauNumIsolationPFCands);
    fChain->SetBranchAddress("nJet", &nJet, &b_nJet);
    fChain->SetBranchAddress("jetPt", &jetPt, &b_jetPt);
    fChain->SetBranchAddress("jetEn", &jetEn, &b_jetEn);
    fChain->SetBranchAddress("jetEta", &jetEta, &b_jetEta);
    fChain->SetBranchAddress("jetPhi", &jetPhi, &b_jetPhi);
    fChain->SetBranchAddress("jetRawPt", &jetRawPt, &b_jetRawPt);
    fChain->SetBranchAddress("jetRawEn", &jetRawEn, &b_jetRawEn);
    fChain->SetBranchAddress("jetArea", &jetArea, &b_jetArea);
    fChain->SetBranchAddress("jetpfCombinedInclusiveSecondaryVertexV2BJetTags", &jetpfCombinedInclusiveSecondaryVertexV2BJetTags, &b_jetpfCombinedInclusiveSecondaryVertexV2BJetTags);
    fChain->SetBranchAddress("jetJetProbabilityBJetTags", &jetJetProbabilityBJetTags, &b_jetJetProbabilityBJetTags);
    fChain->SetBranchAddress("jetpfCombinedMVABJetTags", &jetpfCombinedMVABJetTags, &b_jetpfCombinedMVABJetTags);
    fChain->SetBranchAddress("jetPartonID", &jetPartonID, &b_jetPartonID);
    fChain->SetBranchAddress("jetGenJetIndex", &jetGenJetIndex, &b_jetGenJetIndex);
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
    fChain->SetBranchAddress("jetPFLooseId", &jetPFLooseId, &b_jetPFLooseId);
    fChain->SetBranchAddress("jetPUidFullDiscriminant", &jetPUidFullDiscriminant, &b_jetPUidFullDiscriminant);
    fChain->SetBranchAddress("jetJECUnc", &jetJECUnc, &b_jetJECUnc);
    fChain->SetBranchAddress("jetFiredTrgs", &jetFiredTrgs, &b_jetFiredTrgs);
    fChain->SetBranchAddress("jetCHF", &jetCHF, &b_jetCHF);
    fChain->SetBranchAddress("jetNHF", &jetNHF, &b_jetNHF);
    fChain->SetBranchAddress("jetCEF", &jetCEF, &b_jetCEF);
    fChain->SetBranchAddress("jetNEF", &jetNEF, &b_jetNEF);
    fChain->SetBranchAddress("jetNCH", &jetNCH, &b_jetNCH);
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
    fChain->SetBranchAddress("AK8Jetnconstituents", &AK8Jetnconstituents, &b_AK8Jetnconstituents);
    fChain->SetBranchAddress("AK8JetPFLooseId", &AK8JetPFLooseId, &b_AK8JetPFLooseId);
    fChain->SetBranchAddress("AK8CHSSoftDropJetMass", &AK8CHSSoftDropJetMass, &b_AK8CHSSoftDropJetMass);
    fChain->SetBranchAddress("AK8JetpfBoostedDSVBTag", &AK8JetpfBoostedDSVBTag, &b_AK8JetpfBoostedDSVBTag);
    fChain->SetBranchAddress("AK8JetJECUnc", &AK8JetJECUnc, &b_AK8JetJECUnc);
    fChain->SetBranchAddress("AK8JetPartonID", &AK8JetPartonID, &b_AK8JetPartonID);
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
    fChain->SetBranchAddress("nAK8softdropSubjet", &nAK8softdropSubjet, &b_nAK8softdropSubjet);
    fChain->SetBranchAddress("AK8softdropSubjetPt", &AK8softdropSubjetPt, &b_AK8softdropSubjetPt);
    fChain->SetBranchAddress("AK8softdropSubjetEta", &AK8softdropSubjetEta, &b_AK8softdropSubjetEta);
    fChain->SetBranchAddress("AK8softdropSubjetPhi", &AK8softdropSubjetPhi, &b_AK8softdropSubjetPhi);
    fChain->SetBranchAddress("AK8softdropSubjetMass", &AK8softdropSubjetMass, &b_AK8softdropSubjetMass);
    fChain->SetBranchAddress("AK8softdropSubjetE", &AK8softdropSubjetE, &b_AK8softdropSubjetE);
    fChain->SetBranchAddress("AK8softdropSubjetCharge", &AK8softdropSubjetCharge, &b_AK8softdropSubjetCharge);
    fChain->SetBranchAddress("AK8softdropSubjetFlavour", &AK8softdropSubjetFlavour, &b_AK8softdropSubjetFlavour);
    fChain->SetBranchAddress("AK8softdropSubjetCSV", &AK8softdropSubjetCSV, &b_AK8softdropSubjetCSV);
    Notify();
}

Bool_t PhoJet_Analyzer_MC::Notify()
{
    // The Notify() function is called when a new file is opened. This
    // can be either for a new TTree in a TChain or when when a new TTree
    // is started when using PROOF. It is normally not necessary to make changes
    // to the generated code, but the routine can be extended by the
    // user if needed. The return value is currently not used.

    return kTRUE;
}

void PhoJet_Analyzer_MC::Show(Long64_t entry)
{
    // Print contents of entry.
    // If entry is not specified, print current entry
    if (!fChain) return;
    fChain->Show(entry);
}
Int_t PhoJet_Analyzer_MC::Cut(Long64_t entry)
{
    // This function may be called from Loop.
    // returns  1 if entry is accepted.
    // returns -1 otherwise.
    return 1;
}


void PhoJet_Analyzer_MC::BookHistos(){

    // Define Histograms here +++++++++++++++++++++++++++++
    f1->cd(); 

    char name[100];
    const Int_t nMassBins = 119;
    const Double_t MassBin[nMassBins+1] = {1, 3, 6, 10, 16, 23, 31, 40, 50, 61, 73, 86, 100, 115, 132, 150, 169, 189, 210, 232, 252, 273, 295, 318, 341, 365, 390, 416, 443, 471, 500, 530, 560, 593, 626, 660, 695, 731, 768, 806, 846, 887, 929, 972, 1017, 1063, 1110, 1159, 1209, 1261, 1315, 1370, 1427, 1486, 1547, 1609, 1673, 1739, 1807, 1877, 1950, 2025, 2102, 2182, 2264, 2349, 2436, 2526, 2619, 2714, 2812, 2913, 3018, 3126, 3237, 3352, 3470, 3592, 3718, 3847, 3980, 4117, 4259, 4405, 4556, 4711, 4871, 5036, 5206, 5381, 5562, 5748, 5940, 6138, 6342, 6552, 6769, 6993, 7223, 7461, 7706, 7959, 8219, 8487, 8764, 9049, 9343, 9646, 9958, 10280, 10612, 10954, 11307, 11671, 12046, 12432, 12830, 13241, 13664, 14000};


    h_mass_VarBin = new TH1F("h_mass_VarBin","mass of photon+jet",nMassBins,MassBin);
    h_mass_VarBin->GetYaxis()->SetTitle("Events");                      h_mass_VarBin->GetYaxis()->CenterTitle();
    h_mass_VarBin->GetXaxis()->SetTitle("Mass M_{#gamma jet} (GeV)");   h_mass_VarBin->GetXaxis()->CenterTitle();
    h_mass_VarBin->Sumw2(); 

    h_mass_bin1 = new TH1F("h_mass_bin1","mass of photon+jet",14000,0.0,14000.0);
    h_mass_bin1->GetYaxis()->SetTitle("Events/1 GeV");                h_mass_bin1->GetYaxis()->CenterTitle();
    h_mass_bin1->GetXaxis()->SetTitle("Mass M_{#gamma jet} (GeV)");   h_mass_bin1->GetXaxis()->CenterTitle();
    h_mass_bin1->Sumw2();

    h_mass_X_bin1 = new TH1F("h_mass_X_bin1","mass of photon+jet",14000,0.0,5.0);
    h_mass_X_bin1->GetYaxis()->SetTitle("Events");                            h_mass_X_bin1->GetYaxis()->CenterTitle();
    h_mass_X_bin1->GetXaxis()->SetTitle("X = M_{#gamma jet}/M_{q^{#ast}}");   h_mass_X_bin1->GetXaxis()->CenterTitle();
    h_mass_X_bin1->Sumw2();


    h_CutFlow = new TH1F("h_CutFlow", "cut flow of selection", 14, 0, 14);
    h_CutExpFlow = new TH1F("h_CutExpFlow", "exp cut flow of selection", 14, 0, 14);

    TString cutFlowLabel[14] = {"Total", "HLT", "PrimaryVtx", "PhotonID", "PhotonPtEta", "JetID", "JetPtEta", "Dphi", "DEta", "MassCut", "MET500", "MET250", "MET100", "MET50"};
    for( Int_t bin = 1; bin <= h_CutFlow->GetNbinsX(); ++bin){
	h_CutFlow->GetXaxis()->SetBinLabel(bin, cutFlowLabel[bin-1]);
	h_CutExpFlow->GetXaxis()->SetBinLabel(bin, cutFlowLabel[bin-1]);
    }


} //-- BookHistos

void PhoJet_Analyzer_MC::WriteHistos(){  // WriteHistos


    h_mass_VarBin ->Write();     
    h_mass_bin1   ->Write();     
    h_mass_X_bin1 ->Write();     

    h_CutFlow     ->Write();
    h_CutExpFlow  ->Write();

}

//----------------------
// Spike Cut
//Bool_t PhoJet_Analyzer_MC::NoSpike(Int_t ipho){
//  Bool_t passSpike = false;
//
//  if( fabs(getLICTD(ipho))              < 5.0    &&
//      fabs(Photon_timing_xtal[ipho][0]) < 3.0    &&
//      Photon_SigmaIetaIeta[ipho]        > 0.001  && 
//      Photon_SigmaIphiIphi[ipho]        > 0.001  &&
//      Photonr9[ipho]                    < 1.0){
//    passSpike = true ; 
//  } 
//
//  return passSpike;
//}

//-------------------
//Primary Vertex
Bool_t PhoJet_Analyzer_MC::PrimaryVertex(Int_t &goodVertex){

    Bool_t passVertex = false;
    goodVertex = 0;

    for(Int_t i=0; i<nVtx; ++i){
	if( 
		fabs( (*vtz)[i]  <= 24.0) &&
		(*vndof)[i]      >= 4     &&
		//	(*nTrksPV)[i]    > 7      &&
		fabs( (*vrho)[i] < 2.0 )  &&
		!(*isFake)[i]  
	  )
	    goodVertex++;
    }
    if(goodVertex > 0) passVertex = true;

    return passVertex;
}

//----------------------
// Compute deltaR
Double_t PhoJet_Analyzer_MC::getDR(Double_t eta1, Double_t eta2, Double_t phi1, Double_t phi2){
    Double_t DR = 0.0;
    DR = pow( ( pow((eta1 - eta2), 2.0) + pow((phi1 - phi2), 2.0) ), 0.5);
    return DR;
}

//----------------------
// Compute deltaEta
Double_t PhoJet_Analyzer_MC::getDEta(Double_t eta1, Double_t eta2){
    Double_t dEta = fabs(eta1 - eta2);
    return dEta;
}

//----------------------
// Compute deltaPhi
Double_t PhoJet_Analyzer_MC::getDPhi(Double_t phi1, Double_t phi2){
    Double_t dPhi  = fabs(phi1 - phi2);
    Double_t twopi = 2.0*(TMath::Pi());

    if(dPhi < 0) dPhi = - dPhi;
    if(dPhi >= (twopi - dPhi))dPhi = twopi - dPhi;

    return dPhi;
}

//------------------------
//Compute Invariant mass
Double_t PhoJet_Analyzer_MC::getMass(Int_t p, Int_t j){

    Double_t mass = 0.0;

    TLorentzVector pho;
    pho.SetPtEtaPhiE( (*phoEt)[p], (*phoSCEta)[p], (*phoSCPhi)[p], (*phoE)[p] );

    TLorentzVector jet;
    jet.SetPtEtaPhiE( (*jetPt)[j], (*jetEta)[j], (*jetPhi)[j], (*jetEn)[j] );

    mass = (pho+jet).M();

    return mass;
}

//get Photon Candidate
Int_t PhoJet_Analyzer_MC::getPhotonCand(TString phoWP){
    Int_t pc = -1;
    Bool_t ID = false;
    for(Int_t ipho = 0; ipho < nPho; ++ipho){
	ID = CutBasedPFPhotonID(ipho, phoWP);
	if(ID){
	    pc = ipho;
	    break;
	}
    }
    return pc;
}

//-------------------------------------------
// Cut based Photon ID SPRING15 selection 25ns 
//https://twiki.cern.ch/twiki/bin/view/CMS/CutBasedPhotonIdentificationRun2#SPRING15_selections_25_ns
Bool_t PhoJet_Analyzer_MC::CutBasedPFPhotonID(Int_t ipho, TString phoWP){

    Bool_t photonId = false;

    if(phoWP == "tight"){  // Tight
	if( fabs((*phoSCEta)[ipho]) < 1.4442){ // EB
	    photonId = ( 
		    ((*phoHoverE)[ipho]                <  0.05   ) &&
		    ((*phoSigmaIEtaIEtaFull5x5)[ipho]  <  0.0100 ) &&
		    ((*phoEleVeto)[ipho]              ==  1      ) && 
		    ((*phoPFChIso)[ipho]               <  0.76   ) &&
		    (TMath::Max(((*phoPFNeuIso)[ipho] - rho*EAneutral((*phoSCEta)[ipho])), 0.0) < (0.97 + (0.014 * (*phoEt)[ipho]) + (0.000019 * pow((*phoEt)[ipho], 2.0))) )  &&
		    (TMath::Max(((*phoPFPhoIso)[ipho] - rho*EAphoton( (*phoSCEta)[ipho])), 0.0) < (0.08 + (0.0053 * (*phoEt)[ipho])) ) ); 
	}
	if( fabs((*phoSCEta)[ipho]) > 1.4442){ // EE
	    photonId = ( 
		    ((*phoHoverE)[ipho]                <  0.05   ) &&
		    ((*phoSigmaIEtaIEtaFull5x5)[ipho]  <  0.0268 ) &&
		    ((*phoEleVeto)[ipho]              ==  1      ) && 
		    ((*phoPFChIso)[ipho]               < 0.56    )  &&
		    (TMath::Max(((*phoPFNeuIso)[ipho] - rho*EAneutral((*phoSCEta)[ipho])), 0.0) < (2.09 + (0.139 * (*phoEt)[ipho]) + (0.000025 * pow((*phoEt)[ipho], 2.0))) )  &&
		    (TMath::Max(((*phoPFPhoIso)[ipho] - rho*EAphoton( (*phoSCEta)[ipho])), 0.0) < (0.16 + (0.0034 * (*phoEt)[ipho])) ) ); 
	}
    }

    if(phoWP == "medium"){ // Medium
	if( fabs((*phoSCEta)[ipho]) < 1.4442){ // EB
	    photonId = ( 
		    ((*phoHoverE)[ipho]                <  0.05   ) &&
		    ((*phoSigmaIEtaIEtaFull5x5)[ipho]  <  0.0102 ) &&
		    ((*phoEleVeto)[ipho]              ==  1      ) && 
		    ((*phoPFChIso)[ipho]               <  1.37   )  &&
		    (TMath::Max(((*phoPFNeuIso)[ipho] - rho*EAneutral((*phoSCEta)[ipho])), 0.0) < (1.06 + (0.014 * (*phoEt)[ipho]) + (0.000019 * pow((*phoEt)[ipho], 2.0))) )  &&
		    (TMath::Max(((*phoPFPhoIso)[ipho] - rho*EAphoton( (*phoSCEta)[ipho])), 0.0) < (0.28 + (0.0053 * (*phoEt)[ipho])) ) ); 
	}
	if( fabs((*phoSCEta)[ipho]) > 1.4442){ // EE
	    photonId = ( 
		    ((*phoHoverE)[ipho]                <  0.05   ) &&
		    ((*phoSigmaIEtaIEtaFull5x5)[ipho]  <  0.0268 ) &&
		    ((*phoEleVeto)[ipho]              ==  1      ) && 
		    ((*phoPFChIso)[ipho]               <  1.10   ) &&
		    (TMath::Max(((*phoPFNeuIso)[ipho] - rho*EAneutral((*phoSCEta)[ipho])), 0.0) < (2.69 + (0.0139 * (*phoEt)[ipho]) + (0.000025 * pow((*phoEt)[ipho], 2.0))) )  &&
		    (TMath::Max(((*phoPFPhoIso)[ipho] - rho*EAphoton( (*phoSCEta)[ipho])), 0.0) < (0.39 + (0.0034 * (*phoEt)[ipho])) ) ); 
	}
    }

    if(phoWP == "loose"){ // Loose
	if( fabs((*phoSCEta)[ipho]) < 1.4442){ // EB
	    photonId = ( 
		    ((*phoHoverE)[ipho]                <  0.05   ) &&
		    ((*phoSigmaIEtaIEtaFull5x5)[ipho]  <  0.0102 ) &&
		    ((*phoEleVeto)[ipho]              ==  1      ) && 
		    ((*phoPFChIso)[ipho]               <  3.32   )  &&
		    (TMath::Max(((*phoPFNeuIso)[ipho] - rho*EAneutral((*phoSCEta)[ipho])), 0.0) < (1.92 + (0.014 * (*phoEt)[ipho]) + (0.000019 * pow((*phoEt)[ipho], 2.0))) )  &&
		    (TMath::Max(((*phoPFPhoIso)[ipho] - rho*EAphoton( (*phoSCEta)[ipho])), 0.0) < (0.81 + (0.0053 * (*phoEt)[ipho])) ) ); 
	}
	if( fabs((*phoSCEta)[ipho]) > 1.4442){ // EE
	    photonId = ( 
		    ((*phoHoverE)[ipho]                <  0.05   ) &&
		    ((*phoSigmaIEtaIEtaFull5x5)[ipho]  <  0.0274 ) &&
		    ((*phoEleVeto)[ipho]              ==  1      ) && 
		    ((*phoPFChIso)[ipho]               <  1.97   )  &&
		    (TMath::Max(((*phoPFNeuIso)[ipho] - rho*EAneutral((*phoSCEta)[ipho])), 0.0) < (11.86 + (0.0139 * (*phoEt)[ipho]) + (0.000025 * pow((*phoEt)[ipho], 2.0))) )  &&
		    (TMath::Max(((*phoPFPhoIso)[ipho] - rho*EAphoton( (*phoSCEta)[ipho])), 0.0) < (0.83 + (0.0034 * (*phoEt)[ipho])) ) ); 
	}
    }

    return photonId;
}
// Effective area to be needed in PF Iso for photon ID -- SPRING15 bx25ns
Double_t PhoJet_Analyzer_MC::EAcharged(Double_t eta){
    Float_t EffectiveArea = 0.0;
    if(fabs(eta) >= 0.0   && fabs(eta) < 1.0   ) EffectiveArea = 0.0;
    if(fabs(eta) >= 1.0   && fabs(eta) < 1.479 ) EffectiveArea = 0.0;
    if(fabs(eta) >= 1.479 && fabs(eta) < 2.0   ) EffectiveArea = 0.0;
    if(fabs(eta) >= 2.0   && fabs(eta) < 2.2   ) EffectiveArea = 0.0;
    if(fabs(eta) >= 2.2   && fabs(eta) < 2.3   ) EffectiveArea = 0.0;
    if(fabs(eta) >= 2.3   && fabs(eta) < 2.4   ) EffectiveArea = 0.0;
    if(fabs(eta) >= 2.4                        ) EffectiveArea = 0.0;

    return EffectiveArea;
}

Double_t PhoJet_Analyzer_MC::EAneutral(Double_t eta){
    Float_t EffectiveArea = 0.;
    if(fabs(eta) >= 0.0   && fabs(eta) < 1.0   ) EffectiveArea = 0.0599;
    if(fabs(eta) >= 1.0   && fabs(eta) < 1.479 ) EffectiveArea = 0.0819;
    if(fabs(eta) >= 1.479 && fabs(eta) < 2.0   ) EffectiveArea = 0.0696;
    if(fabs(eta) >= 2.0   && fabs(eta) < 2.2   ) EffectiveArea = 0.0360;
    if(fabs(eta) >= 2.2   && fabs(eta) < 2.3   ) EffectiveArea = 0.0360;
    if(fabs(eta) >= 2.3   && fabs(eta) < 2.4   ) EffectiveArea = 0.0462;
    if(fabs(eta) >= 2.4                        ) EffectiveArea = 0.0656;

    return EffectiveArea;
}

Double_t PhoJet_Analyzer_MC::EAphoton(Double_t eta){
    Float_t EffectiveArea = 0.;
    if(fabs(eta) >= 0.0   && fabs(eta) < 1.0   ) EffectiveArea = 0.1271;
    if(fabs(eta) >= 1.0   && fabs(eta) < 1.479 ) EffectiveArea = 0.1101;
    if(fabs(eta) >= 1.479 && fabs(eta) < 2.0   ) EffectiveArea = 0.0756;
    if(fabs(eta) >= 2.0   && fabs(eta) < 2.2   ) EffectiveArea = 0.1175;
    if(fabs(eta) >= 2.2   && fabs(eta) < 2.3   ) EffectiveArea = 0.1498;
    if(fabs(eta) >= 2.3   && fabs(eta) < 2.4   ) EffectiveArea = 0.1857;
    if(fabs(eta) >= 2.4                        ) EffectiveArea = 0.2183;

    return EffectiveArea;
}


///++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/////-------------------------------------------
///// Cut based Photon ID 25ns 
///// CMS Week 19-23 Oct 2015
///// https://indico.cern.ch/event/455258/contribution/0/attachments/1173322/1695132/SP15_253rd.pdf -- slide-9
///Bool_t PhoJet_Analyzer_MC::CutBasedPFPhotonID(Int_t ipho, TString phoWP){
///
///    Bool_t photonId = false;
///
///    if(phoWP == "tight"){  // Tight
///	if( fabs((*phoSCEta)[ipho]) < 1.4442){ // EB
///	    photonId = ( 
///		    ((*phoHoverE)[ipho]                <  0.05   ) &&
///		    ((*phoSigmaIEtaIEtaFull5x5)[ipho]  <  0.0101 ) &&
///		    ((*phoEleVeto)[ipho]              ==  1      ) && 
///		    ( TMath::Max( ( (*phoPFChIso)[ipho]  - rho*EAcharged((*phoSCEta)[ipho]) ), 0.0) < 0.3 )  &&
///		    ( TMath::Max( ( (*phoPFNeuIso)[ipho] - rho*EAneutral((*phoSCEta)[ipho]) ), 0.0) < (0.63 + (0.014 * (*phoEt)[ipho]) + (0.000019 * pow((*phoEt)[ipho], 2.0))) )  &&
///		    ( TMath::Max( ( (*phoPFPhoIso)[ipho] - rho*EAphoton((*phoSCEta)[ipho])  ), 0.0) < (0.10 + (0.0053 * (*phoEt)[ipho])) ) ); 
///	}
///	if( fabs((*phoSCEta)[ipho]) > 1.4442){ // EE
///	    photonId = ( 
///		    ((*phoHoverE)[ipho]                <  0.05   ) &&
///		    ((*phoSigmaIEtaIEtaFull5x5)[ipho]  <  0.0265 ) &&
///		    ((*phoEleVeto)[ipho]              ==  1      ) && 
///		    ( TMath::Max( ( (*phoPFChIso)[ipho]  - rho*EAcharged((*phoSCEta)[ipho]) ), 0.0) < 0.38 )  &&
///		    ( TMath::Max( ( (*phoPFNeuIso)[ipho] - rho*EAneutral((*phoSCEta)[ipho]) ), 0.0) < (3.18 + (0.139 * (*phoEt)[ipho]) + (0.000025 * pow((*phoEt)[ipho], 2.0))) )  &&
///		    ( TMath::Max( ( (*phoPFPhoIso)[ipho] - rho*EAphoton((*phoSCEta)[ipho])  ), 0.0) < (0.01 + (0.0034 * (*phoEt)[ipho])) ) ); 
///	}
///    }
///
///    if(phoWP == "medium"){ // Medium
///	if( fabs((*phoSCEta)[ipho]) < 1.4442){ // EB
///	    photonId = ( 
///		    ((*phoHoverE)[ipho]                <  0.05   ) &&
///		    ((*phoSigmaIEtaIEtaFull5x5)[ipho]  <  0.0101 ) &&
///		    ((*phoEleVeto)[ipho]              ==  1      ) && 
///		    ( TMath::Max( ( (*phoPFChIso)[ipho]  - rho*EAcharged((*phoSCEta)[ipho]) ), 0.0) < 1.21 )  &&
///		    ( TMath::Max( ( (*phoPFNeuIso)[ipho] - rho*EAneutral((*phoSCEta)[ipho]) ), 0.0) < (0.65 + (0.014 * (*phoEt)[ipho]) + (0.000019 * pow((*phoEt)[ipho], 2.0))) )  &&
///		    ( TMath::Max( ( (*phoPFPhoIso)[ipho] - rho*EAphoton((*phoSCEta)[ipho])  ), 0.0) < (0.18 + (0.0053 * (*phoEt)[ipho])) ) ); 
///	}
///	if( fabs((*phoSCEta)[ipho]) > 1.4442){ // EE
///	    photonId = ( 
///		    ((*phoHoverE)[ipho]                <  0.05   ) &&
///		    ((*phoSigmaIEtaIEtaFull5x5)[ipho]  <  0.0267 ) &&
///		    ((*phoEleVeto)[ipho]              ==  1      ) && 
///		    ( TMath::Max( ( (*phoPFChIso)[ipho]  - rho*EAcharged((*phoSCEta)[ipho]) ), 0.0) < 0.86 )  &&
///		    ( TMath::Max( ( (*phoPFNeuIso)[ipho] - rho*EAneutral((*phoSCEta)[ipho]) ), 0.0) < (4.54 + (0.0139 * (*phoEt)[ipho]) + (0.000025 * pow((*phoEt)[ipho], 2.0))) )  &&
///		    ( TMath::Max( ( (*phoPFPhoIso)[ipho] - rho*EAphoton((*phoSCEta)[ipho])  ), 0.0) < (0.36 + (0.0034 * (*phoEt)[ipho])) ) ); 
///	}
///    }
///
///    if(phoWP == "loose"){ // Loose
///	if( fabs((*phoSCEta)[ipho]) < 1.4442){ // EB
///	    photonId = ( 
///		    ((*phoHoverE)[ipho]                <  0.05   ) &&
///		    ((*phoSigmaIEtaIEtaFull5x5)[ipho]  <  0.0106 ) &&
///		    ((*phoEleVeto)[ipho]              ==  1      ) && 
///		    ( TMath::Max( ( (*phoPFChIso)[ipho]  - rho*EAcharged((*phoSCEta)[ipho]) ), 0.0) < 2.06 )  &&
///		    ( TMath::Max( ( (*phoPFNeuIso)[ipho] - rho*EAneutral((*phoSCEta)[ipho]) ), 0.0) < (8.28 + (0.014 * (*phoEt)[ipho]) + (0.000019 * pow((*phoEt)[ipho], 2.0))) )  &&
///		    ( TMath::Max( ( (*phoPFPhoIso)[ipho] - rho*EAphoton((*phoSCEta)[ipho])  ), 0.0) < (0.40 + (0.0053 * (*phoEt)[ipho])) ) ); 
///	}
///	if( fabs((*phoSCEta)[ipho]) > 1.4442){ // EE
///	    photonId = ( 
///		    ((*phoHoverE)[ipho]                <  0.05   ) &&
///		    ((*phoSigmaIEtaIEtaFull5x5)[ipho]  <  0.0281 ) &&
///		    ((*phoEleVeto)[ipho]              ==  1      ) && 
///		    ( TMath::Max( ( (*phoPFChIso)[ipho]  - rho*EAcharged((*phoSCEta)[ipho]) ), 0.0) < 1.57 )  &&
///		    ( TMath::Max( ( (*phoPFNeuIso)[ipho] - rho*EAneutral((*phoSCEta)[ipho]) ), 0.0) < (7.53 + (0.0139 * (*phoEt)[ipho]) + (0.000025 * pow((*phoEt)[ipho], 2.0))) )  &&
///		    ( TMath::Max( ( (*phoPFPhoIso)[ipho] - rho*EAphoton((*phoSCEta)[ipho])  ), 0.0) < (1.13 + (0.0034 * (*phoEt)[ipho])) ) ); 
///	}
///    }
///
///    return photonId;
///}
///
///// Effective area to be needed in PF Iso for photon ID
///// https://indico.cern.ch/event/455258/contribution/0/attachments/1173322/1695132/SP15_253rd.pdf -- slide-5
///Double_t PhoJet_Analyzer_MC::EAcharged(Double_t eta){
///    Float_t EffectiveArea = 0.0;
///    if(fabs(eta) >= 0.0   && fabs(eta) < 1.0   ) EffectiveArea = 0.0456;
///    if(fabs(eta) >= 1.0   && fabs(eta) < 1.479 ) EffectiveArea = 0.0500;
///    if(fabs(eta) >= 1.479 && fabs(eta) < 2.0   ) EffectiveArea = 0.0340;
///    if(fabs(eta) >= 2.0   && fabs(eta) < 2.2   ) EffectiveArea = 0.0383;
///    if(fabs(eta) >= 2.2   && fabs(eta) < 2.3   ) EffectiveArea = 0.0339;
///    if(fabs(eta) >= 2.3   && fabs(eta) < 2.4   ) EffectiveArea = 0.0303;
///    if(fabs(eta) >= 2.4                        ) EffectiveArea = 0.0240;
///
///    return EffectiveArea;
///}
///
///Double_t PhoJet_Analyzer_MC::EAneutral(Double_t eta){
///    Float_t EffectiveArea = 0.;
///    if(fabs(eta) >= 0.0   && fabs(eta) < 1.0   ) EffectiveArea = 0.0599;
///    if(fabs(eta) >= 1.0   && fabs(eta) < 1.479 ) EffectiveArea = 0.0819;
///    if(fabs(eta) >= 1.479 && fabs(eta) < 2.0   ) EffectiveArea = 0.0696;
///    if(fabs(eta) >= 2.0   && fabs(eta) < 2.2   ) EffectiveArea = 0.0360;
///    if(fabs(eta) >= 2.2   && fabs(eta) < 2.3   ) EffectiveArea = 0.0360;
///    if(fabs(eta) >= 2.3   && fabs(eta) < 2.4   ) EffectiveArea = 0.0462;
///    if(fabs(eta) >= 2.4                        ) EffectiveArea = 0.0656;
///
///    return EffectiveArea;
///}
///
///Double_t PhoJet_Analyzer_MC::EAphoton(Double_t eta){
///    Float_t EffectiveArea = 0.;
///    if(fabs(eta) >= 0.0   && fabs(eta) < 1.0   ) EffectiveArea = 0.1271;
///    if(fabs(eta) >= 1.0   && fabs(eta) < 1.479 ) EffectiveArea = 0.1101;
///    if(fabs(eta) >= 1.479 && fabs(eta) < 2.0   ) EffectiveArea = 0.0756;
///    if(fabs(eta) >= 2.0   && fabs(eta) < 2.2   ) EffectiveArea = 0.1175;
///    if(fabs(eta) >= 2.2   && fabs(eta) < 2.3   ) EffectiveArea = 0.1498;
///    if(fabs(eta) >= 2.3   && fabs(eta) < 2.4   ) EffectiveArea = 0.1857;
///    if(fabs(eta) >= 2.4                        ) EffectiveArea = 0.2183;
///
///    return EffectiveArea;
///}
///++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-------------------------------------------
// Jet ID
// https://twiki.cern.ch/twiki/bin/viewauth/CMS/JetID#Recommendations_for_13_TeV_data
Bool_t PhoJet_Analyzer_MC::jetID(Int_t ijet){

    Bool_t jetID = false;

    if( fabs((*jetEta)[ijet]) <= 2.4){
	jetID = (
		( (*jetCHF)[ijet]  > 0.0  ) &&
		( (*jetNCH)[ijet]  > 0    ) &&
		( (*jetCEF)[ijet]  < 0.99 ) &&
		( (*jetNHF)[ijet]  < 0.90 ) &&
		( (*jetNEF)[ijet]  < 0.90 ) &&
		( (*jetNConstituents)[ijet]  > 1 ));
    }

    if( fabs((*jetEta)[ijet]) > 2.4  && fabs((*jetEta)[ijet]) <= 3.0 ){
	jetID = (
		( (*jetNHF)[ijet]  < 0.90 ) &&
		( (*jetNEF)[ijet]  < 0.90 ) &&
		( (*jetNConstituents)[ijet]  > 1 ));
    }

    return jetID;
}

//-------------------------------------------
// AK8 Jet ID
// https://twiki.cern.ch/twiki/bin/viewauth/CMS/JetID#Recommendations_for_13_TeV_data
Bool_t PhoJet_Analyzer_MC::AK8jetID(Int_t ijet){

    Bool_t jetID = false;

    if( fabs((*AK8JetEta)[ijet]) <= 2.4){
	jetID = (
		( (*AK8JetCHF)[ijet]  > 0.0  ) &&
		( (*AK8JetNCH)[ijet]  > 0    ) &&
		( (*AK8JetCEF)[ijet]  < 0.99 ) &&
		( (*AK8JetNHF)[ijet]  < 0.90 ) &&
		( (*AK8JetNEF)[ijet]  < 0.90 ) &&
		( (*AK8Jetnconstituents)[ijet]  > 1 ));
    }

    if( fabs((*AK8JetEta)[ijet]) > 2.4  && fabs((*AK8JetEta)[ijet]) <= 3.0 ){
	jetID = (
		( (*AK8JetNHF)[ijet]  < 0.90 ) &&
		( (*AK8JetNEF)[ijet]  < 0.90 ) &&
		( (*AK8Jetnconstituents)[ijet]  > 1 ));
    }

    return jetID;
}

#endif // #ifdef PhoJet_Analyzer_MC_cxx
EOF


###Now compilation
     
g++ -Wno-deprecated PhoJet_Analyzer_MC.C -o ${FileNameTag}_${p}.exe -I$ROOTSYS/include -L$ROOTSYS/lib `root-config --cflags` `root-config --libs`
     
echo "--------------------Submitting Job for ${FileNameTag}_${p} Files"   
echo "------------------------Submitting Job #-> ${p}  for  ${sf} to ${ef} Files  -----Total = ${Tot}"

./MakeCondorFiles_new.csh ${FileNameTag}_${p} ${FileNameTag}_dataset.txt

##change for next file
@ sf = ${sf} + ${r}
@ ef = ${ef} + ${r}


rm PhoJet_Analyzer_MC.C
rm PhoJet_Analyzer_MC.h


end ## while loop
     echo " ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo "
end  ## foreach i loop
     echo " <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><> "
     echo "  "
end ## runCase foreach
