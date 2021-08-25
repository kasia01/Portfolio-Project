
Select*
From PortfolioProject..CovidDeaths
Order by 3,4

--Select*
---From PortfolioProject..CovidVacc
--Order by 3,4

--Select Location, date,
--From PortfolioProject.. CovidDeths
--Order by 1,2

select location,date,total_cases,total_deaths from PortfolioProject..CovidDeaths
order by 1,2

--Looking for Total Cases vs Total Deaths
--Shows likechood of dying if you contract covid19

Select location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage from PortfolioProject..CovidDeaths
where location like '%states%'
order by 1,2

--Showing countries with Highest Death Count per Population

Select location, MAX(cast(Total_deaths as int)) as totalDeathCount
from PortfolioProject..CovidDeaths
where continent is not null
group by location
order by totalDeathCount desc

--Showing countries with Highest Death Count per Continent
Select location, MAX(cast(Total_deaths as int)) as totalDeathCount
from PortfolioProject..CovidDeaths
where continent is null
group by location
order by totalDeathCount desc

--Showing New Vaccinations at Total Population

Select dea.continent, dea.location, dea.date, dea.population, vac. new_vaccinations
from PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVacc vac
   On dea.location = vac. location
   and dea.date = vac.date
where dea.continent is not null
order by 2,3





