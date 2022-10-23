#!/usr/bin/env python

# Classe ConfigJSON - gestion Configuration avec fichier JSON
import json
import os

# Liste des clés a ne pas afficher
KEY_SECRET = ["api_key"]

class ConfigJSON(object):
    """
    Classe configuration dans un fichier JSON
    """
    def __init__(self, fichier = 'config.json', dossier = '.'):
        self.fichier = fichier
        self.dossier = dossier
        
        self.config = {}
        
    # verifie l'existence du fichier de config
    def exist_file(self):
        existe = False

        files = os.listdir(self.dossier)
        if self.fichier in files:
            existe = True

        return( existe )

    # Nom du fichier config
    def file_name(self):
        return( self.dossier + '/' + self.fichier )
    
    # Lecture de la configuration dans le fichier config
    def read_file(self):
        if self.exist_file():
            with open(self.dossier + '/' + self.fichier) as fichier:
                self.config = json.load(fichier)

        return

    # Ecriture de la config config.json
    def write_file(self):
        with open(self.dossier + '/' + self.fichier, 'w') as fichier:
            json.dump(self.config, fichier)

        return
    
    def get_config( self, param ):
        val = ""
        if param in self.config:
            val = self.config[param]

        return( val )

    def set_config( self, param, val ):
        self.config[param] = val

        return

    def delete_config( self, param ):
        if param in self.config:
            del self.config[param]

        return

    # representation texte de l'objet
    def __str__(self):
        to_string = "ConfigJSON: [\n"
        to_string += "\t" + f"dossier: '{self.dossier}'" + "\n"
        to_string += "\t" + f"fichier: '{self.fichier}'" + "\n"
        
        to_string += "\tconfig: {\n"
        for key in self.config:
            if not key in KEY_SECRET:
                to_string += "\t\t" + f"{key}: {self.config[key]}" + "\n"
            else:
                to_string += "\t\t" + f"{key}: **secret**" + "\n"
        to_string += "\t}\n"
        to_string += "]\n"
                
        return to_string
    
    def __del__(self):
        pass

