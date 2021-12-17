from dataclasses import dataclass

@dataclass
class yearFormat():
    E: int
    S: int
    M: int

    def __post_init__(self):
        E = self.E
        S = self.S
        M = self.M


E, S, M = map(int, input().split())
year = 1
ESMcalendar = yearFormat(1, 1, 1)

while True:
    if ESMcalendar.E != ESMcalendar.M:
        year += ESMcalendar.M - ESMcalendar.E * 15



print(year, end='')