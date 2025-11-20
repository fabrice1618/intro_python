class NombreComplexe:
    """Représente un nombre complexe avec parties réelle et imaginaire."""

    def __init__(self, re, im):
        """Initialise le nombre complexe avec ses parties."""
        self.re = re      # attribut reçoit la valeur du paramètre
        self.im = im      # attribut reçoit la valeur du paramètre


reel1 = NombreComplexe(im=1, re=2)
#reel1.im = 99
print(f"{reel1.re=}, {reel1.im=}")
