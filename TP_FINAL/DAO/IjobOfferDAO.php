<?php namespace DAO;

use Models\JobOffer as JobOffer;

interface IjobOfferDAO
{
    function Add(JobOffer $jobOffer);
    function GetAll();
}